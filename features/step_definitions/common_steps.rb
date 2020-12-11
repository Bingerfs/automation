
Given(/^I am in the login page$/) do
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

Then(/^a message in green shows up "([^"]*)"$/) do |message|
    expect(page).to have_content(message)
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
    navbar = Navbar.new(page)
    navbar.go_to(link)
end

When(/^I press the "([^"]*)" option within "([^"]*)"$/) do |option, link|
    navbar = Navbar.new(page)
    navbar.go_to(link, option)
    @pageObject = getPageObject(link + option, page)
end

Given(/^I'm on the "([^"]*)" section of the "([^"]*)" page$/) do |arg, arg2|
    route = getRoute(arg2) + (arg == 'Campañas' ? '' : ('/' + getRoute(arg)))
    expect(page).to have_current_path('/dallex/'+route)
end