require "test_helper"

describe Playlist do
  let(:playlist) { Playlist.new }

  it "must be valid" do
    value(playlist).must_be :valid?
  end
end
