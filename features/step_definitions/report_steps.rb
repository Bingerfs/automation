Given(/^I'm on the login page$/) do
    page.driver.browser.manage.window.maximize
    visit ('/')
end

Given(/^I enter a username and a password$/) do
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
end

When(/^I press the "([^"]*)" button$/) do |nombre|
    if(nombre == "Re-abrir" || nombre == "Cerrar")
        xpath = '/html/body/app-root/div/div/app-events/div/div[5]/div/div[1]/div/event-item/div[1]/div[2]/div/i[2]'
        find(:xpath, xpath).click
    else
        click_on(nombre)
    end
end

When(/^I press the "([^"]*)" option$/) do |link|
    if link == 'Reportes' || link == 'Campaña'
        visit('http://3.14.118.36:8080/dallex/reports')
    else
        click_on(link)
    end
end