dictionary_routes = { 
    "Reportes" => 'reports',
    'Eventos' => 'events' 
}

dictionary_graphics = {
    'Barra Agrupada' => 'grouped-bar-chart',
    'Barra Simple' => 'bar-chart',
    'Barra Apilada' => 'stacked-bar-chart',
    'Area Agrupada' => 'area-chart',
    'Circular' => 'pie-chart',
    'Lineas' => 'line-chart',
    'Contador' => 'counter'
}

dictionary_graphicFieldsAction = {
    'Nombre:' => ->(value, element) { element.fill_in('title', with: value) },
    'Tipo de gráfico:' => ->(value, element) { element.select(value, from: 'type') },
    'Pregunta:' => ->(value, element) { element.select(value, from: 'questionOpt') }
}

dict_graphicFieldsActionMystery = {
    'Nombre:' => ->(value, element) { element.fill_in('title', with: value) },
    'Tipo de gráfico:' => ->(value, element) { element.select(value, from: 'type') },
    'Pregunta:' => ->(value, element) { element.select(value, from: 'question') },
    'Lista:' => ->(value, element) { element.select(value, from: 'group') }
}

dictionary_graphicFields = {
    'Nombre:' => 'title',
    'Tipo de gráfico:' => 'type',
    'Pregunta:' => 'questionOpt',
    'Lista:' => 'group'
}

dictionary_graphicFieldsMystery = {
    'Nombre:' => 'title',
    'Tipo de gráfico:' => 'type',
    'Pregunta:' => 'question',
    'Lista:' => 'group'
}


When(/^I press the "([^"]*)" option$/) do |link|
    if link == 'Reportes' || link == 'Campaña'
        visit('http://3.14.118.36:8080/dallex/reports')
    else
        click_on(link)
    end
end

Given(/^I'm on the "([^"]*)" section of the "([^"]*)" page$/) do |arg, arg2|
    route = dictionary_routes[arg2] + (arg == 'Campañas' ? '' : ('/' + dictionary_routes[arg]))
    expect(page).to have_current_path('/dallex/'+route)
end

When(/^I'm on the "([^"]*)" section$/) do |arg|
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
    @expectedChart = chart.find(dictionary_graphics[graphicType])
end

Then(/^I should see the same graphic "([^"]*)" as it was displayed on the list$/) do |graphicType|
    modal = find('app-full-view')
    actualChart = modal.find(dictionary_graphics[graphicType])
    expect(actualChart['ng-reflect-question-id']).to eq(@expectedChart['ng-reflect-question-id'])
    expect(actualChart['ng-reflect-chart-id']).to eq(@expectedChart['ng-reflect-chart-id'])
end

When(/^fill the required graphic fields as below$/) do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        modal = find('app-create-chart')
        dictionary_graphicFieldsAction[key].(value, modal)
    end
end

When(/^fill the required mystery poll graphic fields as below$/) do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        modal = find('app-ms-chart')
        dict_graphicFieldsActionMystery[key].(value, modal)
    end
end
  
Then(/^a message in green shows up "([^"]*)"$/) do |message|
    expect(page).to have_content(message)
end

Then(/^"([^"]*)" shows up in the graphics list$/) do |graphicName|
    titulo = find('span', text: graphicName, match: :prefer_exact)
    expect(titulo).to have_ancestor('chart')
end

Then(/^"([^"]*)" field shows a set of options as below$/) do |fieldName, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    field = find_field(dictionary_graphicFields[fieldName])
    questionsList.each { |question| expect(field).to have_content(question) }
end 

Then(/^"([^"]*)" field shows a set of list related questions as below$/) do |fieldName, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    field = find_field(dictionary_graphicFieldsMystery[fieldName])
    questionsList.each { |question| expect(field).to have_content(question) }
end
