# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DecksController, type: :controller do
  let!(:user1) { create :user }

  describe 'GET index' do
    let!(:user2) { create :user }
    let!(:deck1) { create :deck, user: user1 }
    let!(:deck2) { create :deck, user: user2 }
    before do
      login_user(user1)
    end
    it "assigns current_user's decks to @decks" do
      get :index
      expect(assigns(:decks)).to include(deck1)
    end
    it "doesn't assign other user's decks to @decks" do
      get :index
      expect(assigns(:decks)).not_to include(deck2)
    end
  end

  describe 'GET new' do
    before do
      login_user(user1)
    end
    it 'assigns new Deck to @deck' do
      get :new
      expect(assigns(:deck)).to be_a_new(Deck)
    end
    it 'renders :new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    before do
      login_user(user1)
    end

    context 'with valid deck' do
      it 'creates a deck' do
        expect {
          post :create, params: { deck: attributes_for(:deck) }
        }.to change(Deck, :count).by(1)
      end
      it 'redirects to decks index' do
        post :create, params: { deck: attributes_for(:deck) }
        expect(response).to redirect_to(decks_path)
      end
    end

    context 'with invalid deck' do
      it "won't create a deck" do
        expect {
          post :create, params: { deck: attributes_for(:invalid_deck) }
        }.to_not change(Deck, :count)
      end
      it 'renders :new' do
        post :create, params: { deck: attributes_for(:invalid_deck) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET edit' do
    let!(:deck) { create(:deck, user: user1) }
    before do
      login_user(user1)
      get :edit, params: { id: deck.id }
    end

    it 'assigns correct @deck' do
      expect(assigns(:deck)).to eq(deck)
    end
    it 'renders :edit' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT update' do
    let!(:deck) { create(:deck, user: user1) }
    before do
      login_user(user1)
    end

    context 'with valid deck' do
      let(:valid_attributes) { attributes_for(:deck) }
      before do
        put :update, params: { id: deck.id, deck: valid_attributes }
        deck.reload
      end

      it 'updates a deck name' do
        expect(deck.name).to eq(valid_attributes[:name])
      end
      it 'redirects to decks index' do
        expect(response).to redirect_to(decks_path)
      end
    end

    context 'with invalid deck' do
      let(:invalid_attributes) { attributes_for(:invalid_deck) }
      before do
        put :update, params: { id: deck.id, deck: invalid_attributes }
        deck.reload
      end

      it "doesn't change deck" do
        expect(deck).to eq(deck)
      end
      it 'renders :edit' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:deck) { create(:deck, user: user1) }
    before do
      login_user(user1)
    end

    it 'destroys deck' do
      expect do
        delete :destroy, params: { id: deck.id }
      end.to change(Deck, :count).by(-1)
    end
    it 'redirects to decks index' do
      delete :destroy, params: { id: deck.id }
      expect(response).to redirect_to(decks_path)
    end
  end

end
