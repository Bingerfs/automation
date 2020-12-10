# something
class Navbar

  @@nav = { locator: 'body > app-root > div > app-header' }
  @@catalogNavItem = { locator: 'Catálogo' }
  @@campaignNavItem = { locator: 'Campañas' }
  @@eventsNavItem = { locator: 'Eventos' }
  @@reportCampNavItem = { locator: '#dropdown-basic > a:nth-child(1)' }
  @@reportEventNavItem = { locator: '#dropdown-basic > a:nth-child(2)' }

  attr_reader :driver

  def initialize(driver)
    @driver = driver
    visit
  end

  def visit
    driver.visit('http://3.14.118.36:8080/dallex')
  end

  def go_to(navItem, dropdownItem = '')
    driver.within(@@nav[:locator]) do
      if navItem == 'Reportes'
        driver.first('#button-basic').click
        driver.find(get_dropdown_locator(dropdownItem)).click
      else
        driver.click_on(get_navbar_locator(navItem))
      end
    end
  end

  private

  def get_dropdown_locator(item)
    case item
    when 'Campañas'
      @@reportCampNavItem[:locator]
    when 'Eventos'
      @@reportEventNavItem[:locator]
    end
  end

  def get_navbar_locator(item)
    case item
    when 'Campañas'
      @@campaignNavItem[:locator]
    when 'Eventos'
      @@eventsNavItem[:locator]
    end
  end
end
