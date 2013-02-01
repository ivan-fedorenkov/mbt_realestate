require 'spec_helper'

describe LotQuestion do
  describe "validation constraints" do
    [:name, :email, :question].each do |field|
      it "#{field} should not be empty or nil" do
        [nil, "", "   "].each do |invalid_example|
          lq = FactoryGirl.build(:lot_question, field => invalid_example)
          lq.valid?.should be_false
        end
      end
    end
  end
end