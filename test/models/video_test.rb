require "test_helper"

describe Video do
  let(:video) { Video.new }

  it "must be valid" do
    value(video).must_be :valid?
  end
end
