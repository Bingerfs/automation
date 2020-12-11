module TouchPointFormFieldsIdDictionary
  dict = {
    'Nombre:' => 'title',
    'Tipo de gráfico:' => 'type',
    'Pregunta:' => 'questionOpt',
    'Regionales:' => 'regionals',
    'Agencias:' => 'agencies',
    'Servicios:'=> 'services',
    'Puntos de Servicio:' => 'points'
  }

  define_method(:getFormField) { |field| return dict[field] }
end

module MysteryShopperFormFieldsIdDictionary
  dict = {
    'Nombre:' => 'title',
    'Tipo de gráfico:' => 'type',
    'Pregunta:' => 'question',
    'Lista:' => 'group',
    'Regionales:' => 'regionals',
    'Agencias:' => 'agencies',
    'Servicios:'=> 'services',
    'Puntos de Servicio:' => 'points'
  }
  define_method(:getFormField) { |field| return dict[field] }
end

module FactoryModalFormFields

  define_method(:makeFormFieldDictionary) { |modal|
    case
    when modal.include?('touchpoint')
      self.class.include TouchPointFormFieldsIdDictionary
    when modal.include?('mysteryshopper')
      self.class.include MysteryShopperFormFieldsIdDictionary
    end }
end

