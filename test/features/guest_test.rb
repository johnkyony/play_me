require "test_helper"

feature "Guest" do
  let(:john) { users(:john)  }
  let(:lena) { users(:lena) }
  let(:glen) { users(:glen) }
  let(:john_birthday) { parties(:john_birthday) }
  let(:glen_at_john_birthday) {guests(:guest_1)}
  let(:video) {videos(:Video_1)}
  
  before do
    sign_in_as glen
  end
 
  scenario "As a guest, Glen sees the music playlist" do
    click_link 'Parties'
    click_link john_birthday.name
    within "#music_playlist" do 
       click_link 'Music Playlist'
    end
    john_birthday.videos.each do |videos|
      assert_content videos.title
      assert_content videos.link
      assert_content videos.voteup
      assert_content videos.votedown
    end 

  end 

  scenario "Glen adds a video on the music playlist" do 
    click_link 'Parties'
    click_link john_birthday.name
    within "#music_playlist" do 
      click_link 'Music Playlist'
    end
    within "#videos_search" do 
      fill_in "search" , with: 'justin bieber what do you mean'
      click_button "Search"
    end

    within "#search_results" do
      within "#video_result_#{search_results.id}" do
        assert_content "justin bieber"
        assert_content "What do you mean"
        click_button "Add Video"
      end
    end

    assert_content "Justin Bieber"
    assert_content "What Do Mean"
  end


end
 
