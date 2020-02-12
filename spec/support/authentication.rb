# frozen_string_literal: true

module AuthenticationForFeatureRequest
  def login user, password = '123qwe'
    user.update_attributes password: password

    page.driver.post sessions_url, {email: user.email, password: password}
    visit root_url
  end
end
