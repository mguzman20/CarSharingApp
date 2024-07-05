require 'rails_helper'
require 'faker'

RSpec.describe Review, type: :model do
  let(:review) { create(:review) }

  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end

  it 'No es valido sin calificacion' do
    review.calificacion = nil
    expect(review).not_to be_valid
  end

  it 'No es valido con calificación negativa' do
    review.calificacion = -1
    expect(review).not_to be_valid
  end

  it 'No es valido con calificación string' do
    review.calificacion = "a"
    expect(review).not_to be_valid
  end

  it 'is not valid with no contenido' do
    review.contenido = nil
    expect(review).not_to be_valid
  end

  it 'is not valid with contenido to short' do
    review.contenido = "abc"
    expect(review).not_to be_valid
  end

  it 'is not valid with contenido integer' do
    review.contenido = 1
    expect(review).not_to be_valid
  end
end
