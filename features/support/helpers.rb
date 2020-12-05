module Dictionary_PollFields
    dict = {
        'Nombre:' => 'title',
        'Tipo de gráfico:' => 'type',
        'Pregunta:' => 'questionOpt',
        'Lista:' => 'group',
        'Regionales:' => 'regionals',
        'Compañia:' => 'companyOpt',
        'Agencias:' => 'agencies',
        'Servicios:'=> 'services',
        'Puntos de Servicio:' => 'points'
    }

    define_method(:getPollField) { |field| return dict[field] }
end

module Dictionary_GraphicFieldsMystery
    dict = {
        'Nombre:' => 'title',
        'Tipo de gráfico:' => 'type',
        'Pregunta:' => 'question',
        'Lista:' => 'group'
    }
    define_method(:getGraphicMysteryField) { |field| return dict[field] }
end

module Dictionary_Routes
    dict = { 
        "Reportes" => 'reports',
        'Eventos' => 'events' 
    }
    define_method(:getRoute) { |route| return dict[route] }
end

module Factory_FieldGraphicAction
    dict = {
        'Nombre:' => ->(value, element) { element.fill_in('title', with: value) },
        'Tipo de gráfico:' => ->(value, element) { element.select(value, from: 'type') },
        'Pregunta:' => ->(value, element) { element.select(value, from: 'questionOpt') },
        'Regionales:' => ->(value, element) { element.select(value, from: 'regionals') },
        'Agencias:' => ->(value, element) { element.select(value, from: 'agencies') },
        'Servicios:' => ->(value, element) { element.select(value, from: 'services') },
        'Puntos de Servicio:' => ->(value, element) { element.select(value, from: 'points') },
    }
    define_method(:getFieldAction) { |field| return dict[field] }
end

module Factory_FieldGraphicMysteryAction
    dict = {
        'Nombre:' => ->(value, element) { element.fill_in('title', with: value) },
        'Tipo de gráfico:' => ->(value, element) { element.select(value, from: 'type') },
        'Pregunta:' => ->(value, element) { element.select(value, from: 'question') },
        'Lista:' => ->(value, element) { element.select(value, from: 'group') }
    }
    define_method(:getFieldMysteryAction) { |field| return dict[field] }
end

module Dictionary_GraphicNames
    dict = {
        'Barra Agrupada' => 'grouped-bar-chart',
        'Barra Simple' => 'bar-chart',
        'Barra Apilada' => 'stacked-bar-chart',
        'Area Agrupada' => 'area-chart',
        'Circular' => 'pie-chart',
        'Lineas' => 'line-chart',
        'Contador' => 'counter'
    }
    define_method(:getGraphicName) { |name| return dict[name] }
end

module MyWorld
    include Dictionary_PollFields
    include Dictionary_Routes
    include Dictionary_GraphicNames
    include Factory_FieldGraphicMysteryAction
    include Factory_FieldGraphicAction
    include Dictionary_GraphicFieldsMystery
end
 

World(MyWorld)