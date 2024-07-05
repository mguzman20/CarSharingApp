require "rails_helper"
require "faker"

RSpec.describe 'SolicitudRequest', type: :request do
  let!(:solicitud) { create(:solicitud) }
  let!(:attr_solicitud) { { descripcion: Faker::Lorem.words(10..20) } }
  let!(:invalid_attr_solicitud) { { descripcion: Faker::Lorem.characters(number: 100) } }

  describe "get index" do
    it "should return a successful request" do
      get "/solicituds"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "get new" do
    it "should return a successful request" do
      get "/solicituds/new"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "get_show" do
    it "should return a successful request" do
      get "/solicitud/#{solicitud.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "create" do
    it "should increase count of Solicitud by 1" do
      expect do
        post "/solicituds", params: { solicitud: solicitud.attributes }
      end.to change(Solicitud, :count).by(1)
    end

    it "should not increase count of Solicitud" do
      expect do
        post "/solicituds", params: { solicitud: invalid_attr_solicitud }
      end.to change(Solicitud, :count).by(1)
    end
  end

  describe "edit" do
    it "should return a successful request" do
      get "/solicituds/#{solicitud.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "update" do
    it "should change a Solicitud" do
      expect do
        patch "/solicitud/#{solicitud.id}", params: { solicitud: { descripcion: "Ejemplo para cambiar" } }
        solicitud.reload
      end.to change(solicitud, :descripcion)
    end
  end

  describe "update" do
    it "should not change a Solicitud" do
      expect do
        patch "/solicitud/#{solicitud.id}", params: { solicitud: { descripcion: "example" } }
        solicitud.reload
      end.to change(solicitud, :attributes)
    end
  end

  describe "delete" do
    it "should decrease count of Solicitud by 1" do
      expect do
        delete "/solicitud/#{solicitud.id}"
      end.to change(Solicitud, :count).by(-1)
    end
  end
end
