require 'spec_helper'

describe Spree::Admin::SuggestionsController do
  stub_authorization!

  before { controller.stub spree_current_user: create(:user) }

  context "#index" do
  end

  context "#destroy" do
  end

  context "#collection" do
  end
end
