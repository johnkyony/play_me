require "test_helper"

feature "Guest" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  
 
  

 

  scenario "" do
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
