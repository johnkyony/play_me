class PartiesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "logged in should get the index page" do
    sign_in users(:user)
    get :index
    assert_response :success
  end

  test "not authenticated should get redirect" do
    get :index
    assert_response :redirect
  end

  test "Create a new party" do
    sign_in users(:user)    
    get :new 
  end

end

