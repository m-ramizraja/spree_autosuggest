require 'spec_helper'

describe Spree::Suggestion do
  it { should validate_presence_of :keywords }

  context "relevant" do
  end
end
