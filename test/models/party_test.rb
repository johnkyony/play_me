require "test_helper"

describe Party do

  let(:party) { Party.new }

  it "Party  saves with all parameters" do 
    john_birthday_party = Party.create(name: "New york after party" , location:"My house" , occurence:"12/01/2016" , user_id: users(:john).id)
    assert john_birthday_party.valid? , 'The party #{john_birthday_party.name} was successfully saved'   
    assert_equal 'New york after party', john_birthday_party.name, 'Party name does not match'
  end

  it "Party doesn't save without all parameters" do
    john_birthday_party = Party.create(name: "The end of the year one")
    assert_not john_birthday_party.valid?, 'The party should not be valid when missing location , occurence , user_id'
  end
end
