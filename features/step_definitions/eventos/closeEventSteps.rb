=begin
Given(/^I am on the login page$/) do
    page.driver.browser.manage.window.maximize
    visit ('/')
end

Given(/^enter a username and a password$/) do
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
end

Given(/^I'm in the Eventos page$/) do
    visit ('/events')
end

When(/^I choose "([^"]*)" checkbox$/) do |valueToSearch|
  clickOn ()
end
When I choose "Offline" checkbox
=end