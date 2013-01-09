require 'spec_helper'

describe Features do
  describe "initialization" do
    it "should raise an error if initialization string doesn't match the pattern" do
      lambda { Features.new("Some invalid input string") }.should raise_error(RuntimeError)
    end
  end

  describe "instance methods" do
    let(:features) { Features.new("feature 1: option 1, option 2; feature 2: option 3") }
    describe "#to_hash" do
      it "should return a hash of features" do
        features.to_hash.should eql({"feature 1" => ["option 1","option 2"], "feature 2" => ["option 3"]})
      end
    end
  end
end
