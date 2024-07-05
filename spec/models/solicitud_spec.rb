require "rails_helper"
require 'faker'

RSpec.describe 'SolicitudModel', type: :model do
  let(:solicitud) { create(:solicitud) }

  it "is valid with valid attributes" do
    expect(solicitud).to be_valid
  end

  it "is not valid with descripcion too long" do
    solicitud.descripcion = Faker::Lorem.characters(number: 200)
    expect(solicitud).not_to be_valid
  end

  it "is not valid with no descripción" do
    solicitud.descripcion = nil
    expect(solicitud).not_to be_valid
  end

  it "is not valid with no estado" do
    solicitud.estado = nil
    expect(solicitud).not_to be_valid
  end

  it "is not valid with estado not boolean" do
    solicitud.estado = "a"
    expect(solicitud).not_to be_valid
  end
end
