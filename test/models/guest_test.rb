require "test_helper"

describe Guest do
  let(:guest) { Guest.new }
  let(:halloween) { parties(:halloween)}
  let(:john_birthday) { parties(:john_birthday) }
  let(:glen) { users(:glen) }

  it "must be valid if all the parameter are there" do
   guest = Guest.create(user_id: glen.id , party_id: halloween.id)
   assert guest.valid? , 'The guest was successfully invited'
   assert_equal glen.id , guest.user_id , "The guest user id do'nt match"
  end

  it "The guest should not be saved without all the parameters" do
    guest = Guest.create(user_id: glen.id )
    assert_not guest.valid? , 'Please retry'
  end

  it "Should not save the same guest twice at a party" do 
    skip
    duplicate_guest = Guest.create(user_id: glen.id , party_id: john_birthday.id)
    existing_guest = Guest.where(user_id: duplicate_guest.user_id , party_id: john_birthday.id)
    refute_match  existing_guest.nil? ,existing_guest 
    assert_not duplicate_guest.valid? , 'The user has been added already'
  end
end

