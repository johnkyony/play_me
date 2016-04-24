require 'test_helper'

feature 'Party' do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }

  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}   

  before do
    sign_in_as john
  end

  scenario 'Current user must be able to create a new party' do
    click_link 'New Party'

    fill_in 'Name' , with: 'New Year Eve Party' 
    fill_in 'Location' , with:  'Far, Far, Far Away' 
    select '2016', from:  'party_occurence_1i'
    select 'December', from:  'party_occurence_2i'
    select '31', from:  'party_occurence_3i'
    select '20', from:  'party_occurence_4i'
    select '00', from:  'party_occurence_5i'
    click_button 'Save'


    assert_content 'A new Event has been successfully created.'
    assert_content 'New Year Eve Party'
    assert_content 'Far, Far, Far Away'
    assert_content '2016-12-31 20:00'

  end

  scenario 'Current user must be able to see all the parties he has created' do
    click_link 'Parties'
    john.parties.each do |party|
      assert_content party.name
    end
  end

  scenario 'John  should be able to see all the guests invited to his birthday party' do 
    click_link 'Parties'
    click_link john_birthday.name
    john_birthday.guests.each do |guest|
      assert_content guest.user.name
    end
  end

  scenario 'john the host should be able to edit the party details' do
    click_link 'Parties'
    click_link john_birthday.name
    click_link 'Edit'

    fill_in 'Name' , with: 'New Year Eve Party' 
    fill_in 'Location' , with:  'Far, Far, Far Away' 
    select '2016', from:  'party_occurence_1i'
    select 'December', from:  'party_occurence_2i'
    select '31', from:  'party_occurence_3i'
    select '20', from:  'party_occurence_4i'
    select '00', from:  'party_occurence_5i'
    click_button 'Save'

    assert_content "The party was successfully updated"

  end 
  

end


