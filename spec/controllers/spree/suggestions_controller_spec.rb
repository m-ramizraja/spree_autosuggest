require 'spec_helper'

describe Spree::SuggestionsController do
  stub_authorization!

  before { controller.stub spree_current_user: nil }

  context "#index" do
  end
end
