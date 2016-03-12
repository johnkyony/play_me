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

  scenario 'Current user must be able to create a new Event' do
    click_link 'New Event'

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

  # scenario 'John should be able to invite Lena to his birth party ' do
    
  #   visit parties_path
  #   click_link john_birthday.name
  #   # Check that Lena is not yet in the guest list
  #   refute_content lena.name 

  #   # Add Lena to the list
  #   click_link 'Send Invitations'

  #   select lena.name, from: 'guest_user_id'
  #   click_button 'Add friend'

  #   # now Lena is on the list of guest
  #   assert_content lena.name
  # end

  scenario 'John should be able to remove Glen from his birth party ' do
    skip
    visit parties_path
    click_link john_birthday.name

   # Check first that  Glen is on the guest list 
    assert_content glen.name

    # Remove Glen from the list
    within("#guest_#{glen_at_john_birthday.id}")  do
      find('.fa.fa-remove').click
    end

    # now Glem is not on the list of guest
    refute_content glen.name
  end

  scenario "John the host should'nt be able to add himself has a guest" do 
    skip
    visit parties_path
    click_link john_birthday.name

    # adding the host as a guest 
    click_link 'Add Guest'
    select john.name , from: 'guest_user_id'
    click_button 'Add friend'

    assert_content "You can't invite the host himself"


  end

  scenario "Lena should not be displayed twice to the same party " do
    skip

  end

end


