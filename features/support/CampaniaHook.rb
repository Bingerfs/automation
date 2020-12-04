Before('@ReporteCampania') do
    page.driver.browser.manage.window.maximize
    log('The thing')
    visit ('/')
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
    button = find_button('Iniciar Sesión')
    scroll_to(button)
    button.click
    visit ('http://3.14.118.36:8080/dallex/catalog')
    find('.catalog-title > div:nth-child(1) > div:nth-child(2) > span:nth-child(1) > i:nth-child(1)').click
    within('app-create-catalog') do
        fill_in('Ingrese nombre del catálogo', :with => 'CatalogTest')
        fill_in('Ingrese descripción del catálogo', :with => 'catalog test')
        select('Los olivos')
        click_on('Crear')
    end
    visit ('http://3.14.118.36:8080/dallex/campaigns')
    click_on('Agregar Campaña')
    within('app-create-campaign') do
        fill_in('Ingrese nombre', :with => 'CampaignTest')
        select('Los olivos', from: 'companyId')
        fill_in('Fecha de inicio', :with => '02-03-2020')
        fill_in('Fecha de conclusión', :with => '02-12-2020')
        find(:xpath, '/html/body/modal-container/div/div/app-create-campaign/div/form/div[1]/div[5]/input').fill_in(:with => '#de70e6')
        attach_file('file', File.absolute_path('images/EZywBTTVcAE5r3J.jpeg'), make_visible: true)
    end
end