# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TestsController, type: :controller do
  describe 'GET index' do
    it 'redirects to new test' do
      get :index
      expect(response).to redirect_to(new_test_path)
    end
  end

  describe 'GET new' do
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

  # describe 'POST create' do
  #   before do
  #     @test_attributes = attributes_for(:test)
  #   end
  #   it 'assigns @test with params' do
  #     post :create, params: { test: @test_attributes }
  #     expect(assigns(:test)).to_eq build(:test, @test_attributes)
  #   end
  #   context 'with successful test' do
  #     #TODO
  #     it 'redirects to root' do
  #       expect(response).to redirect_to(root_path)
  #     end
  #   end
  #   context 'with failed test' do
  #     #TODO
  #     it 'renders new' do
  #       expect(response).to render_template(:new)
  #     end
  #   end
  # end
end
