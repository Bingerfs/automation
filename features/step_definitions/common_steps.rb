
Given(/^I'm on the login page$/) do
    page.driver.browser.manage.window.maximize
    visit ('/')
end

Given(/^I enter a username and a password$/) do
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
end

When(/^click on the "([^"]*)" button$/) do |nombre|
    button = find_button(nombre)
    scroll_to(button)
    button.click
end