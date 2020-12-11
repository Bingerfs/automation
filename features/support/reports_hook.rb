After('@addGraphic') do
  visit ('/')
  fill_in 'usernameField', :with => ENV['USER']
  fill_in 'passwordField', :with => ENV['PSW']
  button = find_button('Iniciar Sesión')
  scroll_to(button)
  button.click
  using_wait_time 10 do
    expect(page).to have_text 'Filtrar'
  end
  visit ('http://3.14.118.36:8080/dallex/reports')
  pageobj = ReportCampaign.new(page)
  pageobj.clickOnCampaign('CasaMatriz')
  pageobj.clickOnPoll('Asignacion Cajas')
  pageobj.deleteGraphic('GraphicTest')
end

After('@addGraphicEvent') do
  visit ('/')
  fill_in 'usernameField', :with => ENV['USER']
  fill_in 'passwordField', :with => ENV['PSW']
  button = find_button('Iniciar Sesión')
  scroll_to(button)
  button.click
  using_wait_time 10 do
    expect(page).to have_text 'Filtrar'
  end
  visit ('http://3.14.118.36:8080/dallex/reports/events')
  pageobj = ReportEvent.new(page)
  pageobj.deleteGraphic('EventGraphicTest2')
end
