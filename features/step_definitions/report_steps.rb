dictionary_routes = { 
    "Reportes" => 'reports',
    'Eventos' => 'events' 
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

When(/^click on the "([^"]*)" campaign$/) do |arg|
    within('.sidebar-reports-campaign') do
        element = find('span', text: arg)
        element.click
    end
end

Then(/^the polls assigned to the campaign should be displayed as below:$/) do |list|
    data = list.raw
    data = data.flatten
    listOfCampaigns = find('.sidebar-reports-campaign')
    data.each {|poll| expect(listOfCampaigns).to have_content(poll)}
end
