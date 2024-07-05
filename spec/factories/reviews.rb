require 'faker'

FactoryBot.define do
  factory :review do
    calificacion { 1 }
    contenido { "MyString" }
    user { create(:user) }
  end
end
