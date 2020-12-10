
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
end

Given(/^I'm on the "([^"]*)" section of the "([^"]*)" page$/) do |arg, arg2|
    route = getRoute(arg2) + (arg == 'Campañas' ? '' : ('/' + getRoute(arg)))
    expect(page).to have_current_path('/dallex/'+route)
end


Then(/^a campaign named "([^"]*)" is displayed inside the list$/) do |campaign|
  @reportCampaignPage = ReportCampaign.new(page)
  campaigns = @reportCampaignPage.getCampaigns
  expect(campaigns).to include(campaign)
end 

When(/^click on the "([^"]*)" campaign$/) do |campaign|
    @campaignShared = campaign
    @reportCampaignPage = ReportCampaign.new(page)
    @reportCampaignPage.clickOnCampaign(campaign)
end

Then(/^the polls assigned to the campaign are displayed as below:$/) do |list|
    data = list.raw
    data = data.flatten
    polls = @reportCampaignPage.getPolls(@campaignShared)
    data.each { |expectedPoll| expect(polls).to include(expectedPoll) }
end

When(/^click on the "([^"]*)" poll$/) do |poll|
  @reportCampaignPage.clickOnPoll(poll)
end

When(/^click on the eye icon on the "([^"]*)" graphic of type "([^"]*)"$/) do |graphic, graphicType|
  @reportCampaignPage.openGraphic(graphic)
end

Then(/^I see the same graphic "([^"]*)" of type "([^"]*)" as it was displayed on the list$/) do |graphicName, graphicType|
  expected = @reportCampaignPage.getGraphicInfoFromList(graphicName, graphicType)
  actual = @reportCampaignPage.getGraphicInfoFromModal(graphicName, graphicType)
  expect(actual).to eq(expected)
end

When(/^fill the required graphic fields as below$/) do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        modal = find('app-create-chart')    
        getFieldAction(key).(value, modal)
    end
end

When(/^fill the required graphic events fields as below$/) do |table|
    data = table.rows_hash
    @reportCampaignPage.fillInNewGraphicData(data['Nombre:'], data['Tipo de gráfico:'], data['Pregunta:'])
end

When(/^fill the required mystery poll graphic fields as below$/) do |table|
    data = table.rows_hash
    @reportCampaignPage.fillInNewMysteryGraphicData(data['Nombre:'], data['Tipo de gráfico:'], data['Lista:'], data['Pregunta:'])
end

When(/^I'm on the "([^"]*)" section$/) do |arg|
end

Then(/^"([^"]*)" of type "([^"]*)" shows up in the graphics list$/) do |graphicName, graphicType|
  graphic = @reportCampaignPage.getGraphicInfoFromList(graphicName, graphicType)
  expect(graphic).to be
end

Then(/^"([^"]*)" field shows a set of options as below$/) do |fieldName, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    questions = @reportCampaignPage.getQuestions(fieldName)
    questionsList.each { |question| expect(questions).to include(question) }
end 

Then(/^"([^"]*)" field shows a set of list related questions as below$/) do |fieldName, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    questions = @reportCampaignPage.getQuestionsMystery(fieldName)
    questionsList.each { |question| expect(questions).to include(question) }
end
  

When(/^click on the gear icon on the "([^"]*)" graphic$/) do |graphicName|
  @reportCampaignPage.configureGraphic(graphicName)
end

When(/^select on the fields as below$/) do |table|
  data = table.rows_hash
  @reportCampaignPage.fillInConfigureGraphicData(data['Agencias:'], data['Regionales:'], data['Pregunta:'], data['Servicios:'], data['Puntos de Servicio:'])
end

When(/^select "([^"]*)" on the "([^"]*)" field events$/) do |option, field|
    modal = find('app-event-settings')
    modal.select(option, from: getPollField(field))
end