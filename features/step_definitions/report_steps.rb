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
    'Lista:' => 'group',
    'Regionales:' => 'regionals',
    'Compañia:' => 'companyOpt',
    'Agencias:' => 'agencies',
    'Servicios:'=> 'services',
    'Puntos de Servicio:' => 'points'
}

dictionary_graphicFieldsMystery = {
    'Nombre:' => 'title',
    'Tipo de gráfico:' => 'type',
    'Pregunta:' => 'question',
    'Lista:' => 'group'
}


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
    route = dictionary_routes[arg2] + (arg == 'Campañas' ? '' : ('/' + dictionary_routes[arg]))
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
        if (modal == nil)
            modal = find('app-event-chart')
        end
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

When(/^I'm on the "([^"]*)" section$/) do |arg|
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

When('click on the gear icon on the {string} graphic') do |string|
    titulo = find('span', text: string)
    chart = titulo.ancestor('chart')
    chart.find('.fa-cog').click
end
  
When('select {string} on the {string} field') do |string, string2|
    modal = find('app-event-settings')
    modal.select(string, from: dictionary_graphicFields[string2])
end