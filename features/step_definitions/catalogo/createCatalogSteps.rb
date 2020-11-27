Given(/^I'm on the login page$/) do
    page.driver.browser.manage.window.maximize
    visit ('/')
end

Given(/^I enter a username and a password$/) do
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
end

When(/^I press the "([^"]*)" button$/) do |arg1|
    click_on(arg1)
end

When(/^I press the "([^"]*)" option in the navbar$/) do |link|
    click_on(link)
end

Given(/^I'm in the "Catalogo" page$/) do
    catalogo_path = "/catalog"
    expect(page).to have_current_path(catalogo_path, ignore_query: true)
end