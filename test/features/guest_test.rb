require "test_helper"

feature "Guest" do
  before do
    skip
    visit root_path
    click_link("Sign up")
    fill_in('Name' , :with => "john")
    fill_in('Email' , :with => "kyony@gmail.com")
    fill_in('Password' , :with => "johnte12" )
    fill_in('Password confirmation' , :with => "johnte12")
    click_button('Sign up')
    @guest = guests(:cool_guy)
  end

  scenario "When guest invited to a party should be able to see the party details" do
    skip
    visit root_path
  end

  scenario "When guest invited to a party should be able to see the party details" do
    skip     
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

 

  scenario "If invited to party the should should be able to invite his friend" do
    skip
    visit root_path
    page.assert_text("Parties")
    visit parties_path
    click_link('Invitation')
    visit('#Invitation')
    click_link("Add your friends")
    visit new_guest_invatation_path
    select(users(:admin).name, :from=> 'User')
  end 


end
