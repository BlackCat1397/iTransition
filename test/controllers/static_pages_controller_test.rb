require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "iTexts"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | iTexts"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | iTexts"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | iTexts"
  end
end
