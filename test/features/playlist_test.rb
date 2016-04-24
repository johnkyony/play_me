require "test_helper"

feature "playlist" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}
  let(:travis_scott) {tracks(:Track_1)}
  
  before do
    sign_in_as glen

  end
 
  scenario "Glen sees the  playlist" do
    click_link 'Parties'
    click_link john_birthday.name

    within "#playlist" do 
      john_birthday.playlists.each do |playlist|
        assert_content playlist.track.name
        assert_content playlist.track.artwork_url
        
      end        
    end
    
  end   
 


  scenario "Glen adds a track on the  playlist" do 
    click_link john_birthday.name    
    within "#playlist" do 
      # He doesn't see the track from Travis Scott
      refute_content travis_scott.name
      click_link "Add Music"
    end

    # Glen adds Travis Scott track to the playlist
    select travis_scott.name, from: 'playlist_track_id'
    click_button "Add Music"
    # Glen is happy because he can see that the track has been added to the playlist
    assert_content "#{travis_scott.name} has been added to the playlist."
    assert_content travis_scott.name
  end

end
 
