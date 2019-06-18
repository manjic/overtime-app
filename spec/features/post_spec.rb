require 'rails_helper'

describe "navigate" do
  describe "Index" do
    it "can be reached successfully" do
      visit posts_path
      expect(page.status_code).to be(200)
    end

    it "has title of Posts" do
      visit posts_path
      expect(page).to have_content(/Posts/)
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
  end
end
