require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #aimesays" do
    it "returns http success" do
      get :aimesays
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #careers" do
    it "returns http success" do
      get :careers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #videos" do
    it "returns http success" do
      get :videos
      expect(response).to have_http_status(:success)
    end
  end

end
