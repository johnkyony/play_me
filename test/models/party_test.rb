require "test_helper"

describe Party do

  let(:john_birthday) { parties(:john_birthday) }

  it "must not have empty attributes" do
    party = Party.new

    assert party.invalid?
    assert party.errors[:name].any?
    assert party.errors[:location].any?
    assert party.errors[:occurence].any?
  end

  it "must have a unique name" do
    party = Party.new(  name: john_birthday.name ,
                        location: john_birthday.location ,
                        occurence: john_birthday.occurence ,
                        user_id: john_birthday.user_id)

    assert party.invalid?
    assert_equal ["has already been taken"], party.errors[:name]
  end


end
