require "test_helper"

describe Party do
  let(:party) { Party.new }

  it "The party variable must be present" do
    # value(party).must_be :valid? 
    value(party.name).must_be :present?
    value(party.location).must_be :present?
    value(party.occurence).must_be :present?
    value(party.user).must_be :present?
  end
end
