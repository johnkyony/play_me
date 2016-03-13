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

  it "should not be saved without all the parameters" do
    guest = Guest.create(user_id: glen.id )
    assert_not guest.valid? , 'Please retry'
  end

  it "Should not be saved the same guest twice at a party" do 
    
    guest = Guest.create(user_id: glen.id , party_id: john_birthday.id) 
    
    assert guest.invalid? , 'The user has been added already'
  end
end

