require "test_helper"

feature "Guest" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}
  let(:video) {videos(:Video_1)}
  let(:travis_scott) {videos(:Video_2)}
  
  before do
    sign_in_as glen
  end
 
  scenario "As a guest, Glen sees the music playlist" do
    click_link 'Parties'
    click_link john_birthday.name
    within "#music_playlist" do 
       click_link 'Music Playlist'
    end
    john_birthday.playlist.each do |playlist|
      assert_content playlist.video.title
      assert_content playlist.video.link
      assert_content playlist.video.voteup
      assert_content playlist.video.votedown
    end 

  end 

  scenario "Glen adds a video on the music playlist" do 
    
    click_link 'Parties'
    click_link john_birthday.name
    within "#music_playlist" do 
      click_link 'Music Playlist'
    end
    click_link 'Add Music'
    within "#videos_#{travis_scott.id}" do 
      assert_content travis_scott.title
      assert_content travis_scott.link
      assert_content travis_scott.voteup
      assert_content travis_scott.votedown
      click_link "Add To Playlist"
    end

    assert_content travis_scott.title
    assert_content travis_scott.link
    assert_content travis_scott.voteup
    assert_content travis_scott.votedown


  end


end
 
