require 'spec_helper'

describe Features do
  describe "initialization" do
    it "should set a feature title to `INVALID` and copy whole feature input string as option in case of error" do
      invalid_feature = "Some invalid input string"
      Features.new(invalid_feature).to_hash.should eql({"INVALID" => invalid_feature})
    end
  end

  describe "instance methods" do
    let(:features) { Features.new("feature 1 => option 1 @@ option 2 @@@ feature 2 => option 3") }
    describe "#to_hash" do
      it "should return a hash of features" do
        features.to_hash.should eql({"feature 1" => ["option 1","option 2"], "feature 2" => ["option 3"]})
      end
    end
  end
end
