module Dictionary_Routes
    dict = {
      "Reportes" => 'reports',
      'Eventos' => 'events'
    }
    define_method(:getRoute) { |route| return dict[route] }
end

module PageObjectFactory
    define_method(:getPageObject) { |path, driver|
        pageObj = nil
        case path
        when 'ReportesEventos'
            pageObj = ReportEvent.new(driver)
        when 'ReportesCampañas'
            pageObj = ReportCampaign.new(driver)
        end
        return pageObj
    }
end

module MyWorld
    include Dictionary_Routes
    include PageObjectFactory
end


World(MyWorld)