
def createCatalog(nameCatalog)
    find('.catalog-title > div:nth-child(1) > div:nth-child(2) > span:nth-child(1) > i:nth-child(1)').click
    within('app-create-catalog') do
        fill_in('Ingrese nombre del catálogo', :with => nameCatalog)
        fill_in('Ingrese descripción del catálogo', :with => 'catalog test')
        select('Casa Matriz')
        click_on('Crear')
    end
end
def createPoll(namePoll)
    find('span', text: 'CatalogTest').click
    find('span', text: 'Crear Encuesta').click
    within('app-create-survey') do
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[1]/input').fill_in(:with => namePoll)
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[2]/input').fill_in(:with => 'poll test')
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[3]/select').select('Customer Experience')
        find(:xpath, '/html/body/modal-container/div/div/app-create-survey/div/form/div[1]/div[4]/ng-select/div/div/div[2]/input').fill_in(:with => 'autT')
        find('span', text: 'autT').click
        click_on('Crear')
    end
end

def createQuestionView(nameQuestion)
    find('body > app-root > div > div > app-surveys > div > div > div.col-lg-10.pt-3 > div > div > div.row.ng-star-inserted > div > div.row.odd.ng-star-inserted > div > survey-view > div > div.row.survey-table-item.table-rows.odd-text > div.col-2.text-right.survey-table-icon.vertical-align-center > i').click
    click_on('Agregar pregunta')
    within('app-create-question') do
        find(:xpath, '/html/body/modal-container/div/div/app-create-question/div/form/div[1]/div[1]/input').fill_in(:with => nameQuestion)
        select('Escala de Puntos')
        find(:xpath, '/html/body/modal-container/div/div/app-create-question/div/form/div[1]/div[3]/score-range/div[1]/input').fill_in(:with => '1')
        find(:xpath, '/html/body/modal-container/div/div/app-create-question/div/form/div[1]/div[3]/score-range/div[2]/input').fill_in(:with => '3')
        click_on('Crear')
    end
end

def createPollViews()
    find('span', text: 'CatalogTest').click
    find('span', text: 'PollTest').click
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
    createQuestionView('TestQuestion')
end

def createCampaign(nameCampaign)
    click_on('Agregar Campaña')
    within('app-create-campaign') do
        fill_in('Ingrese nombre', :with => nameCampaign)
        select('Casa Matriz', from: 'companyId')
        fill_in('Fecha de inicio', :with => '02-03-2020')
        fill_in('Fecha de conclusión', :with => '02-12-2020')
        find(:xpath, '/html/body/modal-container/div/div/app-create-campaign/div/form/div[1]/div[5]/input').fill_in(:with => '#de70e6')
        find('#file', visible: :all).send_keys(File.expand_path('images\EZywBTTVcAE5r3J.jpeg'))
        click_on('Crear')
    end
end

def asignPollToCampaign(namePoll)
    asignButton = find('span', text: 'Asignar Encuesta', wait: 120)
    asignButton.click
    click_on('Cancelar')
    asignButton.click
    within('app-assign-surveys', wait: 120) do
        fill_in('Ingrese nombre de asignación', :with => namePoll)
        fill_in('Fecha de inicio', :with => '02-03-2020')
        fill_in('Fecha de conclusión', :with => '20-12-2020')
        find('span', { text: namePoll, wait: 120 }).click
        find(:xpath, '/html/body/modal-container/div/div/app-assign-surveys/div/div[2]/div[4]/div[2]/div/div/div/div[2]/div/div/div/span/input').check
        find('label', text: 'Inicio:').click
        click_on('Asignar')
    end
end

Before('@ReporteCampania') do
    page.driver.browser.manage.window.maximize
    visit ('/')
    fill_in 'usernameField', :with => ENV['USER']
    fill_in 'passwordField', :with => ENV['PSW']
    button = find_button('Iniciar Sesión')
    scroll_to(button)
    button.click
    using_wait_time 10 do
      expect(page).to have_text 'Filtrar'
    end
    visit ('http://3.14.118.36:8080/dallex/catalog')
    visit ('http://3.14.118.36:8080/dallex/catalog')
    createCatalog('CatalogTest')
    createPoll('PollTest')
    createPollViews()
    visit ('http://3.14.118.36:8080/dallex/campaigns')
    createCampaign('CampaignTest')
    find('span', text: 'CampaignTest', wait: 120).click
    asignPollToCampaign('PollTest')
end

After('@ReporteCampania') do
  visit ('http://3.14.118.36:8080/dallex/catalog')
  catalog = find('span', text: 'CatalogTest')
  container = catalog.find(:xpath, '../..')
  container.find('i', class: ['fa-trash']).click
  click_on('Si')
  visit ('http://3.14.118.36:8080/dallex/campaigns')
  campaign = find('span', text: 'CampaignTest')
  container = campaign.find(:xpath, '../..')
  container.find('i', class: ['fa-caret-down']).click
  click_on('Eliminar')
  click_on('Si')
end
