# frozen_string_literal: true
require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = create(:user, email: 'jaimito@gmail.com', username: 'jaimito')
  end

  test 'should get user profile by username' do
    get :profile, username: @user.username
    assert_response :success
  end

  test 'should get user profile by id' do
    get :profile, username: @user.id
    assert_response :success
  end

  test 'should get user ad list' do
    get :listads, id: @user.id
    assert_response :success
  end
end
