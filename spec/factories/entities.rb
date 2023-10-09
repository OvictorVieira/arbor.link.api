FactoryBot.define do
  factory :entity, class: 'Entity' do
    name { "Escola Exemplo" }
    entity_type { "school" }
    inep { "123456" }
    parent_id { 1 }
  end
end
