# frozen_string_literal: true

require 'rails_helper'

describe 'Unregistered user locale is set depending on browser language', type: :feature do
  scenario 'Browser language is english' do
    page.driver.header 'Accept-Language', 'en'

    visit root_path
    expect(page).to have_content 'Flashcardr'
  end

  scenario 'Browser language is russian' do
    page.driver.header 'Accept-Language', 'ru'

    visit root_path
    expect(page).to have_content 'Флэшкарточкер'
  end
end

describe 'language can be set manually', type: :feature do
  scenario 'unregistered user picks the language' do
    visit root_path
    click_link 'Язык'
    click_link 'English'

    expect(page).to have_content 'Flashcardr'
  end

  scenario 'registered user sets language through profile settings' do
    login (create :user)

    click_link 'Edit profile'
    select 'ru', from: 'Interface language'
    fill_in 'user_password', with: '123qwe'
    fill_in 'user_password_confirmation', with: '123qwe'
    click_on 'commit'

    expect(page).to have_content 'Флэшкарточкер'
  end
end
