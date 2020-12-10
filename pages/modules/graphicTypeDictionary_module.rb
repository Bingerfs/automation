
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