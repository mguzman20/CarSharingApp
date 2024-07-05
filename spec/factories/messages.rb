FactoryBot.define do
  factory :message do
    content { "MyString" }
    user { nil }
    solicitud { nil }
    sol_id { 1 }
  end
end
