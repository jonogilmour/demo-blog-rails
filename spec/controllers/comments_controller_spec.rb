require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "POST comments" do
    before(:each) do
      post = build(:post)
      post.update_attribute(:id, 245)
    end

    it "creates a new comment" do
      expect do
        post :create, params: { post_id: 245, comment: { name: "Jackson", comment: "Hi there" } }
      end.to change { Comment.count }.from(0).to(1)
    end

    it "creates a new comment on a specific post" do
      the_post = Post.find(245)
      expect do
        post :create, params: { post_id: 245, comment: { name: "Jackson", comment: "Hi there" } }
      end.to change { the_post.comments.count }.from(0).to(1)
    end

    it "raises error where comment details param missing" do
      expect do
        post :create, params: {
          post_id: 245
        }
      end.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "DELETE comment" do
    before(:each) do
      post = build(:post)
      post.update_attribute(:id, 245)
      post.comments.create(attributes_for(:comment))
    end

    context "success" do

      it "destroys an existing comment" do
        the_post = Post.find(245)
        the_comment = the_post.comments.first
        expect do
          delete :destroy, params: { post_id: the_post.id, id: the_comment.id }
        end.to change { the_post.comments.count }.from(1).to(0)
      end

    end
  end

end
