require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET index" do

    it "routes to index successfully" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

end
