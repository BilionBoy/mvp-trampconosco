# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular "funcao", "funcoes"
  inflect.irregular "categoria", "categorias"
  inflect.irregular "prestante", "prestantes"


end
