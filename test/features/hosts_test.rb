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
    click_link 'Edit' 
    # Glen tries to change the party details
    fill_in 'Name' , with: 'New Year Eve Party' 
    fill_in 'Location' , with:  'Far, Far, Far Away' 
    select '2016', from:  'party_occurence_1i'
    select 'December', from:  'party_occurence_2i'
    select '31', from:  'party_occurence_3i'
    select '20', from:  'party_occurence_4i'
    select '00', from:  'party_occurence_5i'
    click_button 'Save'
    # An error message shows that glen can't change details since he is not the host of the party
    assert_content "Sorry you're not the host of the party "
  end
end
 