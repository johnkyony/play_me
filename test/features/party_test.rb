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
   
    click_link 'New Event'
    
    page.must_have_content "Please type in details of your new event"
    fill_in('Name' , :with => @halloween.name )
    fill_in('Password' , :with => @halloween.password)
    fill_in('Location' , :with => @halloween.location)
    select(@halloween.occurence, :from=> 'Occurence')
    # fill_in('Occurence' , :with => @halloween.occurence) 
    click_button('Save')  
    # visit parties_path
  
  end

  scenario "Current user must be able to see all the parties he has created" do
    
    # page.assert_text("Parties")
    click_link "Parties"
    # visit parties_path

    page.must_have_content "Name"
    page.must_have_content  "Location"
    page.must_have_content "Password"
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


