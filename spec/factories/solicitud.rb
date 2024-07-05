require 'faker'

FactoryBot.define do
  factory :solicitud do
    descripcion { Faker::Lorem.paragraph }
    user { create(:user) }
    publication { create(:publication) }
    estado { "false" }
  end
end
