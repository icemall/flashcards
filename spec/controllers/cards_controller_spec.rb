# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'GET index' do
    it 'assigns @cards' do
      card = Card.create!(original_text: 'cat', translated_text: 'кошка', review_date: Date.today)
      get :index
      expect(assigns(:cards)).to eq([card])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
