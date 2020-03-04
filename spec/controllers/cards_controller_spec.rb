# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'GET index' do
    let!(:user1) { create :user }
    let!(:user2) { create :user }
    let!(:card1) { create :card, deck: create(:deck, user: user1) }
    let!(:card2) { create :card, deck: create(:deck, user: user2) }
    before do
      login_user(user1)
    end

    it "assigns current_user's cards to @cards" do
      get :index
      expect(assigns(:cards)).to include(card1)
    end

    it "doesn't assign other user's cards to @cards" do
      get :index
      expect(assigns(:cards)).not_to include(card2)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
