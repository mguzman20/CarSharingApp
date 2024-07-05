require 'faker'

FactoryBot.define do
  factory :publication do
    dia { Faker::Date.in_date_period }
    salida { Faker::Address.street_address }
    hora { '11:11' }
    tipo { 'ida' }
    limite { Faker::Number.number(digits: 1) }
    direccion { Faker::Address.street_address }
    user { create(:user) }
  end
end
