

When(/^click on the eye icon on the "([^"]*)" graphic of type "([^"]*)"$/) do |graphic, graphicType|
  @pageObject.openGraphic(graphic)
end

When(/^click on the gear icon on the "([^"]*)" graphic$/) do |graphicName|
  @pageObject.configureGraphic(graphicName)
end

Then(/^I see the same graphic "([^"]*)" of type "([^"]*)" as it was displayed on the list$/) do |graphicName, graphicType|
  expected = @pageObject.getGraphicInfoFromList(graphicName, graphicType)
  actual = @pageObject.getGraphicInfoFromModal(graphicName, graphicType)
  expect(actual).to eq(expected)
end

When(/^fill the required graphic fields on the "([^"]*)" as below$/) do |modal, table|
  data = table.rows_hash
  @pageObject.fillInFormGraphicData(modal, data)
end

When(/^I'm on the "([^"]*)" section$/) do |arg|
end

Then(/^"([^"]*)" of type "([^"]*)" shows up in the graphics list$/) do |graphicName, graphicType|
  graphic = @pageObject.getGraphicInfoFromList(graphicName, graphicType)
  expect(graphic).to be
end

Then(/^"([^"]*)" field on the "([^"]*)" shows a set of options as below$/) do |fieldName, modal, questionsList|
    questionsList = questionsList.raw
    questionsList = questionsList.flatten
    questions = @pageObject.getOptions(fieldName, modal)
    questionsList.each { |question| expect(questions).to include(question) }
end
