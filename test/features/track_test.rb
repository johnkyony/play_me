require "test_helper"

feature "Track" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}
  let(:track) {tracks(:Track_1)}
  let(:travis_scott) {tracks(:Track_2)}
  
  before do
    sign_in_as glen
  end  
  # scenario "Glen can add a track to the playlist" do
  #   click_link john_birthday.name    
  #   within "#playlist" do 
  #     # He doesn't see the video from Travis Scott
  #     refute_content travis_scott.title
  #     click_link "Add Music"
  #   end

    

  
  # end
 
end
