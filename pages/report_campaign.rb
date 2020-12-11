require_relative './modules/graphicTypeDictionary_module'
require_relative './modules/modalFormFactory_module'

class ReportCampaign
  include Dictionary_GraphicNames
  include FactoryModalFormFields

  @@listOfCampaigns = { locator: 'aside' }
  @@listOfPolls = { locator: '../../../..' }
  @@polls = { locator: 'span', options: { class: ['sidebar-name'], wait: 30 } }
  @@campaigns = { locator: 'span', options: { class: ['sidebar-name', 'text-overflow-campaigns-sidebar'], match: :prefer_exact } }
  @@listOfGraphics = { locator: 'div', options: { class: ['ng-sidebar__content'], match: :prefer_exact } }
  @@modalChart = { locator: 'app-full-view' }
  @@modalCreate = { locator: 'app-create-chart' }
  @@modalConfigure = { locator: 'app-settings' }
  @@modalCreateMystery = { locator: 'app-ms-chart' }
  @@nameField = { locator: 'title' }
  @@typeField = { locator: 'type' }
  @@questionField = { locator: 'questionOpt' }
  @@questionMysteryField = { locator: 'question' }
  @@listField = { locator: 'group' }
  @@agencyField = { locator: 'agencies' }
  @@regionalField = { locator: 'regionals' }
  @@serviceField = { locator: 'services' }
  @@pointServiceField = { locator: 'points' }
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def clickOnCampaign(campaign)
    @campaignFound = nil
    driver.within(@@listOfCampaigns[:locator]) do
      @campaignFound = driver.find('span', text: campaign)
      @campaignFound.click
    end
  end

  def clickOnPoll(poll)
    container = @campaignFound ? @campaignFound.find(:xpath, @@listOfPolls[:locator]) : nil
    driver.within(container) do
      driver.find('span', text: poll).click
    end
  end

  def getPolls(campaign)
    driver.scroll_to(@campaignFound)
    container = @campaignFound ? @campaignFound.find(:xpath, @@listOfPolls[:locator]) : nil
    driver.using_wait_time 15 do
      driver.find('span', text: 'CAMPAÑAS DISPONIBLES').click
    end
    driver.within(container) do
      texts = driver.all(@@polls[:locator], @@polls[:options]).map { |span| span.text }
      return texts
    end
  end

  def getCampaigns
    driver.within(@@listOfCampaigns[:locator]) do
      texts = driver.all(@@campaigns[:locator], @@campaigns[:options]).map { |span| span.text }
      return texts
    end
  end

  def openGraphic(graphicName)
    driver.within(@@listOfGraphics[:locator], @@listOfGraphics[:options]) do
      titulo = driver.find('span', text: graphicName)
      chart = titulo.ancestor('chart')
      chart.find('.fa-eye').click
    end
  end

  def deleteGraphic(graphicName)
    driver.within(@@listOfGraphics[:locator], @@listOfGraphics[:options]) do
      titulo = driver.find('span', text: graphicName)
      chart = titulo.ancestor('chart')
      chart.find('.fa-trash').click
    end
    driver.click_on('Si')
  end

  def configureGraphic(graphicName)
    driver.within(@@listOfGraphics[:locator], @@listOfGraphics[:options]) do
      titulo = driver.find('span', text: graphicName)
      chart = titulo.ancestor('chart')
      chart.find('.fa-cog').click
    end
  end

  def getGraphicInfoFromList(graphicName, graphicType)
    driver.within(@@listOfGraphics[:locator], @@listOfGraphics[:options]) do
      titulo = driver.find('span', text: graphicName, match: :prefer_exact)
      chart = titulo.ancestor('chart')
      graphic = chart.find(getGraphicName(graphicType))
      return { 'questionId' => graphic['ng-reflect-question-id'], 'graphicId' => graphic['ng-reflect-chart-id'] }
    end
  end

  def getGraphicInfoFromModal(graphicName, graphicType)
    driver.within(@@modalChart[:locator]) do
      graphic = driver.find(getGraphicName(graphicType))
      return { 'questionId' => graphic['ng-reflect-question-id'], 'graphicId' => graphic['ng-reflect-chart-id'] }
    end
  end

  def fillInFormGraphicData(modal, data)
    makeFormFieldDictionary(modal)
    data.each_pair do |key, value|
      if key == 'Nombre:'
        driver.fill_in(getFormField(key), with: value)
      else
        driver.select(value, from: getFormField(value))
      end
    end
  end

  def fillInConfigureGraphicData(agency, regional, question, service, pointService)
    regional ? driver.select(regional, from: @@regionalField[:locator]) : nil
    agency ? driver.select(agency, from: @@agencyField[:locator]) : nil
    service ? driver.select(service, from: @@serviceField[:locator]) : nil
    pointService ? driver.select(pointService, from: @@pointServiceField[:locator]) : nil
  end

  def fillInNewMysteryGraphicData(name, type, group, question)
    driver.within(@@modalCreateMystery[:locator]) do
      name ? driver.fill_in(@@nameField[:locator], with: name) : nil
      type ? driver.select(type, from: @@typeField[:locator]) : nil
      group ? driver.select(group, from: @@listField[:locator]) : nil
      question ? driver.select(question, from: @@questionMysteryField[:locator]) : nil
    end
  end

  def getOptions(fieldName, modal)
    makeFormFieldDictionary(modal)
    field = driver.find_field(getFormField(fieldName))
    sleep 5
    texts = field.all('option').map { |option| option.text }
    return texts
  end
end