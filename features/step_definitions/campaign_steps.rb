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