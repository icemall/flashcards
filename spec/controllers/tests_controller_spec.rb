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
      end
    end
    context 'with flashcards to test' do
      it 'assigns @test' do
      end
      it 'renders new' do
      end
    end
  end

  describe 'POST create' do
    it 'assigns @test' do
    end
    context 'with successful test' do
      it 'redirects to root if test has been passed' do
      end
    end
    context 'with failed test' do
      it 'renders new if test has been failed' do
      end
    end
  end
end
