Given(/^I'm on the login page$/) do
    page.driver.browser.manage.window.maximize
    visit ('/')
end

Given(/^I enter a username and a password$/) do
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
end

When(/^I press the "([^"]*)" button$/) do |nombre|
    click_on(nombre)
end

When(/^I press the "([^"]*)" option$/) do |link|
    if link == 'Reportes' || link == 'Campaña'
        visit('http://3.14.118.36:8080/dallex/reports')
    else
        click_on(link)
    end
end