require 'test_helper'

feature 'Party' do
  before do
    visit root_path
    click_link 'Sign up' 
    fill_in 'Name' , :with => 'john' 
    fill_in 'Email' , :with => 'kyony@gmail.com' 
    fill_in 'Password' , :with => 'johnte12'  
    fill_in 'Password confirmation' , :with => 'johnte12' 
    click_button 'Sign up' 
  end
  
  scenario 'Current user must be able to create a new Event' do
    click_link 'New Event'
    assert_content 'Please type in details of your new event'


    fill_in 'Name' , :with => 'New Year Eve Party' 
    fill_in 'Location' , :with => 'Far, Far, Far Away' 
    select "2016", :from=> 'party_occurence_1i'
    select "December", :from=> 'party_occurence_2i'
    select "31", :from=> 'party_occurence_3i'
    select "20", :from=> 'party_occurence_4i'
    select "00", :from=> 'party_occurence_5i'
    click_button 'Save'

    assert_content 'A new Event has been successfully created.'
    assert_content 'New Year Eve Party'
    assert_content 'Far, Far, Far Away'
    assert_content '2016-12-31 20:00'
  end

  scenario 'Current user must be able to see all the parties he has created' do
    skip

    page.assert_text 'Parties' 
    click_link 'Parties'
    visit parties_path

    page.must_have_content 'Name'
    page.must_have_content  'Location'
    page.must_have_content 'Password'
  end

  scenario 'Current user should be able to add guest to party ' do      
    skip
    visit parties_path
    click_link 'Add Guest'
    visit new_party_guest_path @halloween.id 
    select users(:user .name, :from=> 'User')
    select @halloween.name , :from=> 'Party' 
    click_button 'Add friend', :match => :first   
  end

  scenario 'Current user should be able to see all the guests invited to the party' do 
    skip
    visit parties_path
    click_link 'View Guests'
    visit party_guests_path @halloween 
    page.must_have_content @halloween.user.name
  end

end


