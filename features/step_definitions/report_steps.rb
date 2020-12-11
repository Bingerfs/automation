

When(/^click on the eye icon on the "([^"]*)" graphic of type "([^"]*)"$/) do |graphic, graphicType|
  @reportCampaignPage.openGraphic(graphic)
end

When(/^click on the gear icon on the "([^"]*)" graphic$/) do |graphicName|
  @reportCampaignPage.configureGraphic(graphicName)
end

Then(/^I see the same graphic "([^"]*)" of type "([^"]*)" as it was displayed on the list$/) do |graphicName, graphicType|
  expected = @reportCampaignPage.getGraphicInfoFromList(graphicName, graphicType)
  actual = @reportCampaignPage.getGraphicInfoFromModal(graphicName, graphicType)
  expect(actual).to eq(expected)
end

When(/^fill the required graphic fields as below$/) do |table|
  data = table.rows_hash
  @reportCampaignPage.fillInNewGraphicData(data['Nombre:'], data['Tipo de gráfico:'], data['Pregunta:'])
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

Then(/^"([^"]*)" field on the "([^"]*)" shows a set of options as below$/) do |fieldName, modal, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    questions = @reportCampaignPage.getOptions(fieldName, modal)
    questionsList.each { |question| expect(questions).to include(question) }
end

When(/^select on the fields as below$/) do |table|
  data = table.rows_hash
  @reportCampaignPage.fillInConfigureGraphicData(data['Agencias:'], data['Regionales:'], data['Pregunta:'], data['Servicios:'], data['Puntos de Servicio:'])
end

When(/^select "([^"]*)" on the "([^"]*)" field events$/) do |option, field|
    modal = find('app-event-settings')
    modal.select(option, from: getPollField(field))
end