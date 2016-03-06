require "test_helper"

describe Party do
  let(:party) { Party.new }

  it "must be valid" do
    value(party).must_be :valid?
  end
end
