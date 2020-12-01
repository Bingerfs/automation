Given('I am in the login page') do
  page.driver.browser.manage.window.maximize
  visit('/')
end

Given('enter a username and a password') do
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
end

Given('I am in the Eventos page') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I choose {string} checkbox') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I write {string} in {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I press {string} button') do |string|
    click_on(string)
end

Then('I should see a green message that says {string}') do |string|
    expect(page).to have_content(string)
end

Given('I am in the {string} page') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end