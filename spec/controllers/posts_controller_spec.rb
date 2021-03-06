require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views

  describe "GET index" do
    it "responds 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "responds 200" do
      get :new
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET show" do
    before(:each) do
      post = build(:post)
      post.update_attribute(:id, 245)

      post = build(:post)
      post.update_attribute(:id, 246)
      post.comments.create(attributes_for(:comment))
    end

    it "responds 200" do
      get :show, params: { id: 245 }
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :show, params: { id: 245 }
      expect(response).to render_template("show")
    end

    it "renders a comments form from partial" do
      get :show, params: { id: 245 }
      expect(response).to render_template(partial: "comments/_form")
    end

    it "renders the comments partial if comments are present" do
      get :show, params: { id: 246 }
      expect(response).to render_template(partial: "comments/_comment")
    end
  end

  describe "GET edit" do
    before(:each) do
      post = build(:post)
      post.update_attribute(:id, 245)
    end

    it "responds 200" do
      get :edit, params: { id: 245 }
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :edit, params: { id: 245 }
      expect(response).to render_template("edit")
    end
  end

end
