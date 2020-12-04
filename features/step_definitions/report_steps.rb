
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
    elsif(link == 'Eventos')
        visit('http://3.14.118.36:8080/dallex/reports/events')
    else
        click_on(link)
    end
end

Given(/^I'm on the "([^"]*)" section of the "([^"]*)" page$/) do |arg, arg2|
    route = getRoute(arg2) + (arg == 'Campañas' ? '' : ('/' + getRoute(arg)))
    expect(page).to have_current_path('/dallex/'+route)
end


Then(/^a campaign named "([^"]*)" should be displayed inside the list$/) do |arg|
    within('.sidebar-reports-campaign') do
        element = find('span', text: arg)
        expect(element.text).to eq(arg)
    end
end 

When(/^click on the "([^"]*)" campaign$/) do |campaign|
    @campaignShared = campaign
    within('.sidebar-reports-campaign') do
        element = find('span', text: campaign)
        element.click
    end
end

Then(/^the polls assigned to the campaign are displayed as below:$/) do |list|
    data = list.raw
    data = data.flatten
    listOfCampaigns = find('.sidebar-reports-campaign')
    data.each {|poll| expect(listOfCampaigns).to have_content(poll)}
end

When(/^click on the "([^"]*)" poll$/) do |poll|
    @pollShared = poll
    within('.sidebar-reports-campaign') do
        element = find('span', text: @campaignShared)
        parentContainer = element.find(:xpath, '../../../..')
        foundPoll = parentContainer.find('span', text: poll)
        foundPoll.click
    end
end

When(/^click on the eye icon on the "([^"]*)" graphic of type "([^"]*)"$/) do |graphic, graphicType|
    titulo = find('span', text: graphic)
    chart = titulo.ancestor('chart')
    chart.find('.fa-eye').click
    @expectedChart = chart.find(getGraphicName(graphicType))
end

Then(/^I should see the same graphic "([^"]*)" as it was displayed on the list$/) do |graphicType|
    modal = find('app-full-view')
    actualChart = modal.find(getGraphicName(graphicType))
    expect(actualChart['ng-reflect-question-id']).to eq(@expectedChart['ng-reflect-question-id'])
    expect(actualChart['ng-reflect-chart-id']).to eq(@expectedChart['ng-reflect-chart-id'])
end

When(/^fill the required graphic fields as below$/) do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        modal = find('app-create-chart')
        if (modal == nil)
            modal = find('app-event-chart')
        end
        getFieldAction(key).(value, modal)
    end
end

When(/^fill the required mystery poll graphic fields as below$/) do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        modal = find('app-ms-chart')
        getFieldMysteryAction(key).(value, modal)
    end
end

When(/^I'm on the "([^"]*)" section$/) do |arg|
end

Then(/^"([^"]*)" shows up in the graphics list$/) do |graphicName|
    titulo = find('span', text: graphicName, match: :prefer_exact)
    expect(titulo).to have_ancestor('chart')
end

Then(/^"([^"]*)" field shows a set of options as below$/) do |fieldName, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    field = find_field(getPollField(fieldName))
    questionsList.each { |question| expect(field).to have_content(question) }
end 

Then(/^"([^"]*)" field shows a set of list related questions as below$/) do |fieldName, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    field = find_field(getGraphicMysteryField(fieldName))
    questionsList.each { |question| expect(field).to have_content(question) }
end

When('click on the gear icon on the {string} graphic') do |string|
    titulo = find('span', text: string)
    chart = titulo.ancestor('chart')
    chart.find('.fa-cog').click
end
  
When('select {string} on the {string} field') do |string, string2|
    modal = find('app-event-settings')
    modal.select(string, from: dictionary_graphicFields[string2])
When(/^click on the gear icon on the "([^"]*)" graphic$/) do |graphicName|
    titulo = find('span', text: graphicName)
    chart = titulo.ancestor('chart')
    chart.find('.fa-cog').click
end

When(/^select "([^"]*)" on the "([^"]*)" field$/) do |option, field|
    modal = find('app-settings')
    getFieldAction(field).(option, modal)
end