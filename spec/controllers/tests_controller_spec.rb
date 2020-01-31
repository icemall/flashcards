# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TestsController, type: :controller do
  describe 'GET #new' do
    context 'with no flashcards to test' do
      it 'redirects to root' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
    context 'with flashcards to test' do
      before do
        create(:card, review_date: Date.today)
        get :new
      end
      it 'assigns @test' do
        expect(assigns(:test)).to be_a(Test)
      end
      it 'renders new' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST #create' do
    let!(:card) { create(:testable_card) }

    context 'with successful test' do
      let(:correct_attrs) { { card_id: card.id, translated_text: card.translated_text } }
      it 'moves the card review date' do
        expect do
          post :create, params: { test: correct_attrs }
          card.reload
        end.to change(card, :review_date)
      end
      it 'redirects to root' do
        post :create, params: { test: correct_attrs }
        expect(response).to redirect_to(root_path)
      end
    end
    context 'with failed test' do
      let(:incorrect_attrs) { { card_id: card.id, translated_text: 'incorrect text' } }
      it 'doesnt change card' do
        expect do
          post :create, params: { test: incorrect_attrs }
          card.reload
        end.to_not change(card, :review_date)
      end
      it 'renders new' do
        post :create, params: { test: incorrect_attrs }
        expect(response).to render_template(:new)
      end
    end
  end
end
