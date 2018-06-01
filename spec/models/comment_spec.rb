require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "relates to Post" do
    before(:each) do
      post = build(:post)
      post.update_attribute(:id, 245)
    end

    it "has association has_many Comments" do
      expect(Post.reflect_on_association(:comments).macro).to eq(:has_many)
    end

    it "Comments have association belongs_to Post" do
      expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
    end

    it "has no comments" do
      post = Post.find(245)
      expect(post.comments.count).to eq(0)
    end
  end
end
