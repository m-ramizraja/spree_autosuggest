require 'spec_helper'
require 'test_herlper'

feature "Admin Suggestions", js: true do
  stub_authorization!

  before(:each) do
    visit spree.admin_path
  end

  context "listing Suggestions" do

    before do

      create(:product, :name => 'apache baseball cap', :sku => 'A001')
      create(:product, :name => 'zomg shirt', :sku => 'B001')
      create_suggestions
      click_link "Suggestion"

    end

    it "should list suggestions with correct sorting by Keywords" do
      # Disaply Suggestions in DESC order
      within(:row, 2) { page.should have_content(Spree::Suggestion.all.last.keywords) }
      within(:row, 3) { page.should have_content(Spree::Suggestion.all.first.keywords) }

    end

    it "Should display a destroy link for each suggestion" do

      page.find_link ('Destroy')['/admin/suggestion/'+ (Spree::Suggestion.all.last.id).to_s]
      page.find_link ('Destroy')['/admin/suggestion/'+ (Spree::Suggestion.all.first.id).to_s]

    end

  end

  context "as admin user" ,:js => true do

    before do

      create(:product, :name => 'apache baseball cap', :sku => 'A001')
      create(:product, :name => 'zomg shirt', :sku => 'B001')
      create_suggestions
      click_link "Suggestion"

    end

    it "should  have suggestion Tab in admin pannel" do
      page.should have_content("Suggestions")
    end

    it "should have a link to suggestions in admin pannel" do
      page.find_link("Suggestion")['/admin/suggestions']
    end


  end

  context "Search Suggestions" do

    before do

      create(:product, :name => 'apache baseball cap', :sku => "A100")
      create(:product, :name => 'apache baseball cap2', :sku => "B100")
      create(:product, :name => 'zomg shirt')
      create_suggestions
      click_link "Suggestion"
    end

    it "Should search product_suggestion by their properties" do

      fill_in "q_keywords_cont", :with => "ca"
      click_button "Search"
      page.should have_content("apache baseball cap")
      page.should have_content("apache baseball cap2")
      page.should_not have_content("zomg shirt")
    end




  end

end

