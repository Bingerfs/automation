
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

Given('I filter all {string} events') do |string|
    if (string == "closed")
        xpath = '/html/body/app-root/div/div/app-events/div/div[2]/div[2]/select/option[3]'
        find(:xpath, xpath).click
    end
end