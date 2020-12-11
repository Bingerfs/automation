require_relative './modules/graphicTypeDictionary_module'
require_relative './modules/modalFormFactory_module'

class ReportEvent
  include Dictionary_GraphicNames
  include FactoryModalFormFields

  @@listOfGraphics = { locator: 'app-event-reports' }
  @@modalChart = { locator: 'app-full-view' }
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def openGraphic(graphicName)
    driver.within(@@listOfGraphics[:locator]) do
      titulo = driver.find('span', text: graphicName)
      chart = titulo.ancestor('chart')
      chart.find('.fa-eye').click
    end
  end

  def deleteGraphic(graphicName)
    driver.within(@@listOfGraphics[:locator]) do
      titulo = driver.find('span', text: graphicName)
      chart = titulo.ancestor('chart')
      chart.find('.fa-trash').click
    end
    driver.click_on('Si')
  end

  def configureGraphic(graphicName)
    driver.within(@@listOfGraphics[:locator]) do
      titulo = driver.find('span', text: graphicName)
      chart = titulo.ancestor('chart')
      chart.find('.fa-cog').click
    end
  end

  def getGraphicInfoFromList(graphicName, graphicType)
    driver.within(@@listOfGraphics[:locator]) do
      titulo = driver.find('span', text: graphicName, match: :prefer_exact)
      chart = titulo.ancestor('chart')
      graphic = chart.find(getGraphicName(graphicType))
      return { 'graphicId' => graphic['ng-reflect-chart-id'] }
    end
  end

  def getGraphicInfoFromModal(graphicName, graphicType)
    driver.within(@@modalChart[:locator]) do
      graphic = driver.find(getGraphicName(graphicType))
      return { 'graphicId' => graphic['ng-reflect-chart-id'] }
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

  def getOptions(fieldName, modal)
    makeFormFieldDictionary(modal)
    field = driver.find_field(getFormField(fieldName))
    texts = field.all('option').map { |option| option.text }
    return texts
  end
end