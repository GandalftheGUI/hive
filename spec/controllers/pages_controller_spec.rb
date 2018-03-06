require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "show" do
    context "home" do
      it "shows home page" do
        get :show, params: {page: "home"}
        expect(response).to render_template(:home)
      end

      it "is successful" do
        get :show, params: {page: "home"}
        expect(response.status).to eq(200)
      end
    end

    context "page does not exist" do
      it "is not successful" do
        get :show, params: {page: "qqqqqqqqqqqqqz"}
        expect(response.status).to eq(404)
      end

      it "renders 404" do
        get :show, params: {page: "qqqqqqqqqqqqqz"}
        expect(response).to render_template(:file => "#{Rails.root}/public/404.html")
      end
    end
  end

end
