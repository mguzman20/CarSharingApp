require 'rails_helper'
require 'faker'

RSpec.describe 'PublicationRequest', type: :request do
  let!(:publication) { create(:publication) }
  let!(:invalid_attr_publication) do
    { dia: 1, salida: 'algo', hora: -2, tipo: nil, limite: 5, direccion: 'a' }
  end

  describe 'get index' do
    # Comportamiento esperado
    it 'should return a succesful request' do
      get '/publications/no_reg'
      # Se espera que la respuesta salga bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get new' do
    it 'should return a successful requesst' do
      get '/publications/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get show' do
    it 'should return a successful requesst' do
      get "/publication/#{publication.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # Si se crea una nueva publicación debería aumentar el total de publicaciones
    it 'should increase count of Publication by 1' do
      expect do
        post '/publications', params: { publication: publication.attributes }
      end.to change(Publication, :count).by(1)
    end
    # Si los atributos son inválidos se espera que no se cree la publicación
    it 'should not increase count of Publication by 1' do
      expect do
        post '/publications', params: { publication: invalid_attr_publication }
      end.to change(Publication, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should change a Publication request' do
      get "/publications/#{publication.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Publication' do
      expect do
        patch "/publication/#{publication.id}", params: { publication: { tipo: 'vuelta' } }
        # Se recarga la instancia con los nuevos atributos
        publication.reload
      end.to change(publication, :tipo)
    end
    # Si se hace un cambio con algún atriputo no válido
    it 'should change a Publication' do
      expect do
        patch "/publication/#{publication.id}", params: { publication: { limite: 'algo' } }
        # Se recarga la instancia con los nuevos atributos
        publication.reload
      end.to_not change(publication, :limite)
    end
  end

  describe 'delete' do
    it 'should decrease count of Publication by 1' do
      expect do
        delete "/publication/#{publication.id}"
      end.to change(Publication, :count).by(-1)
    end
  end
end
