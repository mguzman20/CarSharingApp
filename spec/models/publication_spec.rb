require 'rails_helper'
require 'faker'

RSpec.describe 'PublicationModel', type: :model do
  # Se llama a la factory
  let(:publication) { create(:publication) }
  let(:second_publication) { create(:publication) }

  it 'is valid with valid attributes' do
    expect(publication).to be_valid
  end

  it 'is not valid with no dia' do
    publication.dia = nil
    expect(publication).not_to be_valid
  end

  it 'is not valid with no salida' do
    publication.salida = nil
    expect(publication).not_to be_valid
  end

  it 'is not valid with no hora' do
    publication.hora = nil
    expect(publication).not_to be_valid
  end

  it 'is not valid with no tipo' do
    publication.tipo = nil
    expect(publication).not_to be_valid
  end

  it 'is not valid with tipo integer' do
    publication.tipo = 1
    expect(publication).not_to be_valid
  end

  it 'is not valid with no limite' do
    publication.limite = nil
    expect(publication).not_to be_valid
  end

  it 'is not valid with no direccion' do
    publication.direccion = nil
    expect(publication).not_to be_valid
  end

  it 'is not valid with a negative limite' do
    publication.limite = -1
    expect(publication).not_to be_valid
  end

  it 'is not valid with a limite string' do
    publication.limite = "a"
    expect(publication).not_to be_valid
  end

  it 'is not valid with a negative hora' do
    publication.hora = -1
    expect(publication).not_to be_valid
  end

  it 'is not valid with a hora string' do
    publication.hora = "a"
    expect(publication).not_to be_valid
  end
end
