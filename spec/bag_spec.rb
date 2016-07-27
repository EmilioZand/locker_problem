require 'spec_helper'

RSpec.describe "Bag" do
  describe "#initialize" do

    it "can take a size and initialize an object" do
      bag = Bag.new(:small)
      expect(bag.size).to eq(:small)
    end
  end
end
