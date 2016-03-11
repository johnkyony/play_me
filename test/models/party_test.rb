require "test_helper"

describe Party do

  let(:party) { Party.new }
  let(:john_birthday) { parties(:john_birthday) }

  it "Party  saves with all parameters" do 
    john_birthday_party = Party.create(name: "New york after party" , location:"My house" , occurence:"12/01/2016" , user_id: users(:john).id)
    assert john_birthday_party.valid? , 'The party was not created'   
    assert_equal 'New york after party', john_birthday_party.name, 'Party name does not match'
  end

  it "Party doesn't save without all parameters" do
    john_birthday_party = Party.create(name: "The end of the year one")
    assert_not john_birthday_party.valid?, 'The party should not be valid when missing location , occurence , user_id'
  end
  it "It should not save  a party with the same party name  twice " do
    duplicate_party = Party.create(name: john_birthday.name , location: john_birthday.location , occurence: john_birthday.occurence , user_id: john_birthday.user_id)
      
    
    assert_not duplicate_party.valid?, 'The party with the same name was already created'

  end
end
