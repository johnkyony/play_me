require "test_helper"

feature "InvitationTest" do


  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }

  

  scenario 'John should be able to invite Lena to his birth party' do 
    skip
    sign_in_as john
    click_link 'Parties'   
    click_link john_birthday.name
    click_link 'Send invitations'
    select lena.name , from: 'guest_user_id'
    click_button 'Send'

    assert_content "Invitation was successfully sent out"
    assert_content "Pending Invitations"
    assert_content lena.name

  end


   scenario 'Lena should be able to accept her  invitation to john birth day party' do  
    skip 
    sign_in_as lena     
    click_link 'Parties'    
    click_link 'Invitations'
    click_link john_birthday.name 

    assert_content john_birthday.name
    assert_content john_birthday.user
    assert_content john_birthday.location
    assert_content john_birthday.occurence
    john_birthday.guests.each do |guest|
      assert_content guest.user.name
    end
    pending_guest_count = john_birthday.guests.count


    click_button 'Accept Invite'   

    assert_content 'You have accepted invitation'

    new_guest_count = john_birthday.guests.count

    refute_match new_guest_count , pending_guest_count , 'The new guest was not added to the guest list'
    


  end

  scenario 'Lena should be able to decline her invitation to john birth day party' do
    skip
    sign_in_as lena
    click_link 'Parties'
    click_link 'Invitations'
    click_link john_birthday.name
    
    # Making sure that lena can see the party details

    assert_content john_birthday.name
    assert_content john_birthday.user
    assert_content john_birthday.location
    assert_content john_birthday.occurence
    john_birthday.guests.each do |guest|
      assert_content guest.user.name
    end

    # checking the current guest count
    current_guest_count = john_birthday.guests.count

    click_button 'Decline'


    # checking that after the decline action the count as not moved up 
    same_guest_count = john_birthday.guests.count
    assert_match current_guest_count , same_guest_count , 'The user is has been added to the guest list instead'


    assert_content 'You have successfully declined your invitation to the party'
    # making sure that lena does not see the declined party on her feed
    refute_content john_birthday.name



    

  end


  

  scenario "Lena who has already accepted her invitation should be able to invite glen her friend to john's birthday party" do  
    skip 
    sign_in_as lena
    click_link 'Parties'
    click_link john_birthday.name
    # checking that lena can see the party details
    assert_content john_birthday.name
    assert_content john_birthday.user
    assert_content john_birthday.location
    assert_content john_birthday.occurence
    john_birthday.guests.each do |guest|
      assert_content guest.user.name
    end

    # making sure that lena is already a guest
    assert_content "Already going "

    # allowing lena now to invite glen
    click_button 'Invite your friends'
    select glen.name , from: 'guest_user_id'
    click_button 'Send invitation'

    # making sure that the user can see that her invitation has been sent out 
    assert_content 'You have successfully sent out an invitation'
  end 

  scenario "Glen should be able to see that lena invited him to attend john birthday party" do 
    skip 
    sign_in_as glen
    click_link 'Parties'
    click_link 'Invitations'
    click_link john_birthday.name

    

    # Check that lena send the invitation
    assert_content "Invited by" + lena.name 



  end


end
