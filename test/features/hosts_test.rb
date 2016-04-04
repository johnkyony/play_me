require "test_helper"

feature "Hosts" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }

  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}   

  before do
    sign_in_as glen
  end

  scenario 'Glen should not be able to edit the party details since he is not the host' do   
    click_link 'Parties'
    click_link john_birthday.name    
    refute_content 'Edit'
  end
end
