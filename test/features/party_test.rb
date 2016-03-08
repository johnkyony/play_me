require "test_helper"

feature "Party" do
  before do
    visit root_path
    click_link("Sign up")
    fill_in('Name' , :with => "john")
    fill_in('Email' , :with => "kyony@gmail.com")
    fill_in('Password' , :with => "johnte12" )
    fill_in('Password confirmation' , :with => "johnte12")
    click_button('Sign up')
    @halloween = parties(:halloween)
  end
  
  scenario "Current user must be able to create Party" do
    visit parties_path
    click_link 'New party'    
    page.must_have_content "Please type in details of your new event"
    fill_in('Name' , :with => @halloween.name )    
    fill_in('Location' , :with => @halloween.location)
    select(@halloween.occurence, :from=> 'Occurence')    
    click_button('Save')
    visit parties_path
    assert_content "The party #{@halloween.name} has been saved"
    assert_content @halloween.name
    assert_content @halloween.location
    assert_content @halloween.occurence 
  end

  scenario "Current user must be able to see a part hey has created" do
    click_link "Parties"    
    page.must_have_content "Name"
    page.must_have_content  "Location"
    page.must_have_content ""
    
  end

  scenario "Current user should be able to add guest to party " do      
    visit parties_path
    
    click_link 'Add Guest'
    
    # visit new_party_guest_path(@halloween.id)
    select(users(:user).name, :from=> 'User')
    select(@halloween.name , :from=> 'Party')
    click_button("Add friend", :match => :first)  
    visit parties_path
    click_link 'View Guests' , :match => :first
    page.must_have_content @halloween.user.name
     
       
  end
  scenario "Current user should be able to see all the guests invited to the party" do 
    visit parties_path
    click_link 'View Guests' ,:match => :first
    # visit party_guests_path(@halloween)
    page.must_have_content guests.user.name
  end


  
end


