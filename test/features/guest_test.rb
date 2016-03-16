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
 
  

 

  scenario "Glen now a guest at john_birthday may see the Music playlist" do
    click_link 'Parties'
    click_link john_birthday.name
    within "#Music_playlist" do 
       click_link 'Music playlist'
    end
    john_birthday.videos.each do |videos|
      assert_content videos.title
      assert_content videos.link
      assert_content videos.voteup
      assert_content videos.votedown
    end 

  end 

  scenario "Glen should be able to add a video on the music playlist" do 
    click_link 'Parties'
    click_link john_birthday.name
    within "#Music_playlist" do 
      click_link 'Music playlist'
    end
    within "#videosSearch" do 
      fill_in "search" , with: 'justin bieber what do you mean'
      click_button "Search"
    end

    within "#search_results" do
      within "#video_result_#{search_results.id}" do
        assert_content "justin bieber"
        assert_content "What do you mean"
        click_button "Add to playlist"
      end
    end

    assert_content "justin bieber"
    assert_content "what do mean"
    

  end


end
 