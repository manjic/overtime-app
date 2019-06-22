require 'rails_helper'

describe "navigate" do
    before do
      @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
      login_as(@user, :scope=> :user)
    end

  describe "Index" do
    before do
      visit posts_path
    end

    it "can be reached successfully" do
      expect(page.status_code).to be(200)
    end

    it "has title of Posts" do
      expect(page).to have_content(/Posts/)
    end

    it "has a list of posts" do
      post1 = Post.create(date: Date.today, rationale: "Post 1", user_id: @user_id)
      post2 = Post.create(date: Date.today, rationale: "Post 2", user_id: @user_id)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe "creation" do
    before do 
      visit new_post_path
    end

    it "has a new form which can be reached" do
      expect(page.status_code).to be(200)
    end  


    it "can be created from a new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it "will have a user associated with it" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
