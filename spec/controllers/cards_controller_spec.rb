# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'GET index' do
    let!(:card) { create :card }

    it 'assigns @cards' do
      get :index
      expect(assigns(:cards)).to eq([card])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
