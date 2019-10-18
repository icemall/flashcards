# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NavHelper, type: :helper do
  describe 'active link_to' do
    before do
      allow(helper).to receive(:controller_name).and_return('cards')
      allow(helper).to receive(:action_name).and_return('index')
    end
    it 'adds active class to links' do
      expect(helper.active_link_to('anchor', cards_path, controller_name: 'cards', action_name: 'index')).to eq('<a class="active" href="/cards">anchor</a>')
    end
  end
end
