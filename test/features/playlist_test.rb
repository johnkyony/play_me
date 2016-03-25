require "test_helper"

feature "playlist" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}
  let(:video) {videos(:Video_1)}
  let(:travis_scott) {videos(:Video_2)}
  
  before do
    sign_in_as glen
<<<<<<< HEAD
  end
 
  scenario "Glen sees the  playlist" do
    click_link 'Parties'
    click_link john_birthday.name
    within "#playlist" do 
       click_link 'Playlist'
    end
    john_birthday.playlist.each do |playlist|
      assert_content playlist.video.title
      assert_content playlist.video.link
      assert_content playlist.video.voteup
      assert_content playlist.video.votedown
    end 
  end 

  scenario "Glen adds a video on the  playlist" do     
    click_link 'Parties'
    click_link john_birthday.name
    within "#playlist" do 
      click_link 'Playlist'
    end
    click_link 'Add Music'

    # glen shall see all the videos and be able to choose the travis scott video
    within "#videos_#{travis_scott.id}" do 
      assert_content travis_scott.title      
      click_link "Add To Playlist"
    end
    # Then glen should be able to the video that he has added on to the playlist
    assert_content travis_scott.title
    


  end


=======
    click_link 'Parties'
    click_link john_birthday.name
  end
 
  scenario "Glen sees the videos on the playlist" do
    within "#playlists" do 
      john_birthday.playlists.each do |playlist|
        assert_content playlist.video.title
        assert_content playlist.video.link
        assert_content playlist.video.voteup
        assert_content playlist.video.votedown
      end 
    end
  end 

  scenario "Glen adds a video on the  playlist" do     
    within "#playlists" do 
      # He doesn't see the video from Travis Scott
      refute_content travis_scott.title
      click_link "Add Video"
    end

    # Glen adds Travis Scott video to the playlist
    select travis_scott.title, from: 'playlist_video_id'
    click_button "Add Video"
    # Glen is happy because he can see that the video has been added to the playlist
    assert_content "#{travis_scott.title} has been added to the playlist."
    assert_content travis_scott.title
  end

>>>>>>> bde09ff4f44161595c7c24b3aa761b40e8458ec6
end
 
