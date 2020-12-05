
Given(/^I am in the login page$/) do
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

Then(/^a message in green shows up "([^"]*)"$/) do |message|
    expect(page).to have_content(message)
end