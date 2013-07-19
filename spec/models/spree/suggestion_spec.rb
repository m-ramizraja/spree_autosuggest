require 'spec_helper'

describe Spree::Suggestion do
  it { should validate_presence_of :keywords }

  context "relevant" do
    before do
      create(:product, name: "apache baseball cap", sku: "A100")
      create(:product, name: "apache baseball cap2", sku: "B100")
      create(:product, name: "zomg shirt")
      create_suggestions
    end

    it "search product_suggestion by their properties" do
      #Spree::Suggestion.relevant("ca") work in progress
    end
  end
end
