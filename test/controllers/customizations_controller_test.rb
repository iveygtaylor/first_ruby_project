require 'test_helper'

class CustomizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customization = customizations(:one)
  end

  test "should get index" do
    get customizations_url
    assert_response :success
  end

  test "should get new" do
    get new_customization_url
    assert_response :success
  end

  test "should create customization" do
    assert_difference('Customization.count') do
      post customizations_url, params: { customization: { avatar: @customization.avatar, connections: @customization.connections } }
    end

    assert_redirected_to customization_url(Customization.last)
  end

  test "should show customization" do
    get customization_url(@customization)
    assert_response :success
  end

  test "should get edit" do
    get edit_customization_url(@customization)
    assert_response :success
  end

  test "should update customization" do
    patch customization_url(@customization), params: { customization: { avatar: @customization.avatar, connections: @customization.connections } }
    assert_redirected_to customization_url(@customization)
  end

  test "should destroy customization" do
    assert_difference('Customization.count', -1) do
      delete customization_url(@customization)
    end

    assert_redirected_to customizations_url
  end
end
