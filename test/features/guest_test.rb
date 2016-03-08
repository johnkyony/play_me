require "test_helper"

feature "Guest" do
  before do
    visit root_path
    click_link("Sign up")
    fill_in('Name' , :with => "john")
    fill_in('Email' , :with => "kyony@gmail.com")
    fill_in('Password' , :with => "johnte12" )
    fill_in('Password confirmation' , :with => "johnte12")
    click_button('Sign up')
    @guest = guests(:cool_guy)
    visit root_path
  end
  scenario "When guest invited to a party should be able to see the party details" do     
    click_link 'Parties'   
    click_link('Invitation')
    # visit('#Invitation')
    # page.must_have_content @guest.party.name
    click_link(@guest.party.name)
    # visit party_path(@guest.party)
    page.must_have_content @guest.party.name
    page.must_have_content @guest.party.location
    page.must_have_content @guest.party.password
  end 

  scenario 'If guest is invited to a party he should be able to accept the invitation' do     
    click_link 'Parties'
    click_link 'Invitation'
    click_link 'Accept'
    assert_content 'You have accepted invitation'
    assert_content 'Add your friends'
  end

  scenario 'If guest is invited to a party he should be able to decline invitation' do
    click_link 'Parties'
    click_link 'Invitation'
    click_link 'decline' , :match => parties(:halloween).name

  end


   scenario 'If guest is invited to a party he should be able to accept the invitation' do     
    click_link 'Parties'
    click_link 'Invitation'
    click_link 'Accept' , :match => parties(:halloween).name
    assert_content 'You have accepted invitation'
    assert_content 'Add your friends'
  end

  scenario "If invited to party the guest should be able to invite his friend" do   
    click_link("Parties")    
    click_link('Invitation')
    visit('#Invitation')
    click_link("Add your friends")    
    select(users(:admin).name, :from=> 'User')

  end 



end
