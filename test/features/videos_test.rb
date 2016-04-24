require "test_helper"

feature "Videos" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }

  before do
    sign_in_as glen
  end

  # scenario "Lena should be able to search for music on api" do
  #  click_link 'Parties'
  #  click_link john_birthday.name
  #   within "#playlist" do      
  #     click_link "Add Music"
  #   end
  #   within "#search" do
  #     fill_in "query" , with: "Drake"
  #     click_button "Search"
  #   end

  #   assert_content "Drake"   
  # end
end
