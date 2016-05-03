require "test_helper"

feature "Track" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}
  let(:ariana_grande) {tracks(:Track_2)}
  let(:travis_scott) {tracks(:Track_1)}
  
  before do
    sign_in_as glen
  end 

  scenario "Glen should be able to search for music " do
   click_link 'Parties'
   click_link john_birthday.name
    within "#playlist" do      
      click_link "Add Music"
    end
    within "#search-form" do
      fill_in "search" , with: ariana_grande.name
      click_button "Search"
    end

    assert_content ariana_grande.name 
  end

  
 
end
