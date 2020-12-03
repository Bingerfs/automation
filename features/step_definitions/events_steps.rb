Given('I am in the login page') do
  page.driver.browser.manage.window.maximize
  visit('/')
end

Given('enter a username and a password') do
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
end

When('I choose {string} checkbox') do |string|
    if (string == "Accionable")
        xpath = '/html/body/modal-container/div/div/app-event-activity/div/form/div[1]/div[1]/label[1]/input'
    elsif(string == "No Accionable")
        xpath = '/html/body/modal-container/div/div/app-event-activity/div/form/div[1]/div[1]/label[2]/input'
    elsif (string == "Offline")
        xpath = '/html/body/modal-container/div/div/app-event-activity/div/form/div[1]/div[2]/label[2]/input'
    elsif(string == "Online")
        xpath = '/html/body/modal-container/div/div/app-event-activity/div/form/div[1]/div[2]/label[1]/input'
    elsif (string == "Contactado")
        xpath = '/html/body/modal-container/div/div/app-event-activity/div/form/div[1]/div[3]/label[1]/input'
    elsif(string == "No Contactado")
        xpath = '/html/body/modal-container/div/div/app-event-activity/div/form/div[1]/div[3]/label[2]/input'
    end
    find(:xpath, xpath).click
end

When('I write {string} in {string}') do |string, string2|
    if (string2 == "Comentarios")
        fill_in('comments', with: string)
    end
end

When('I press {string} button') do |string|
    click_on(string)
end

#/html/body/div/div
Then('I should see a green message that says {string}') do |string|
    text = page.driver.browser.switch_to.alert.text
    expect(text).to eq string
    #expect(page).to have_content(string)
end

Given('I filter all {string} events') do |string|
    select('closed', from: '/html/body/app-root/div/div/app-events/div/div[2]/div[2]/select')
end