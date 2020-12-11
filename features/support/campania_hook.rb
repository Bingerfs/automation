=begin
Before('@ReporteCampania') do
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
    find('span', text: 'CatalogTest').click
    find('span', text: 'Crear Encuesta').click
    within('app-create-survey') do
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[1]/input').fill_in(:with => 'pollTest')
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[2]/input').fill_in(:with => 'poll test')
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[3]/select').select('Customer Experience')
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[4]/ng-select/div/div/div[2]/input').fill_in(:with => 'autT')
        find('span', text: 'autT').click
        click_on('Crear')
    end
    find('span', text: 'CatalogTest').click
    find('span', text: 'pollTest').click
    click_on('Agregar Vista')
    within('app-create-survey-view') do
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey-view/div/form/div[1]/div[1]/input').fill_in(:with => 'TV1')
        select('Inicial')
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey-view/div/form/div[1]/div[3]/input').fill_in(:with => 'Vista inicial')
        click_on('Crear')
    end
    click_on('Agregar Vista')
    within('app-create-survey-view') do
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey-view/div/form/div[1]/div[1]/input').fill_in(:with => 'TV2')
        select('Regular')
        click_on('Crear')
    end
    click_on('Agregar Vista')
    within('app-create-survey-view') do
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey-view/div/form/div[1]/div[1]/input').fill_in(:with => 'TV3')
        select('Final')
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey-view/div/form/div[1]/div[3]/input').fill_in(:with => 'Vista final')
        click_on('Crear')
    end
    find('body > app-root > div > div > app-surveys > div > div > div.col-lg-10.pt-3 > div > div > div.row.ng-star-inserted > div > div.row.odd.ng-star-inserted > div > survey-view > div > div.row.survey-table-item.table-rows.odd-text > div.col-2.text-right.survey-table-icon.vertical-align-center > i').click
    click_on('Agregar pregunta ')
    within('app-create-question') do
        find(:xpath, '/html/body/modal-container/div/div/app-create-question/div/form/div[1]/div[1]/input').fill_in(:with => 'questionTest')
        select('Escala de Puntos')
        find(:xpath, '/html/body/modal-container/div/div/app-create-question/div/form/div[1]/div[3]/score-range/div[1]/input').fill_in(:with => '1')
        find(:xpath, '/html/body/modal-container/div/div/app-create-question/div/form/div[1]/div[3]/score-range/div[2]/input').fill_in(:with => '3')
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
        find('#file', visible: :all).send_keys(File.expand_path('images\EZywBTTVcAE5r3J.jpeg'))
        click_on('Crear')
    end
    find('span', text: 'CampaignTest').click
    click_on('Asignar Encuesta')
    within('app-assign-surveys') do
        fill_in('Ingrese nombre de asignación', :with => 'pollAsigned')
        fill_in('Fecha de inicio', :with => '02-03-2020')
        fill_in('Fecha de conclusión', :with => '20-12-2020')
        find('span', text: 'pollTest').click
        check()
        click_on('Asignar')
    end
end
=end