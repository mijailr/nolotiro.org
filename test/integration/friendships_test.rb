# frozen_string_literal: true
require 'test_helper'
require 'integration/concerns/authentication'
require 'support/web_mocking'

class FriendshipsTest < ActionDispatch::IntegrationTest
  include Authentication

  before do
    @user = FactoryGirl.create(:user)
    @friend = FactoryGirl.create(:user)

    login_as @user
    visit profile_path(@friend)
  end

  it "creates friendships from target users' profile" do
    click_link "agregar #{@friend.username} a tu lista de amigos"

    assert_content "Agregado #{@friend.username} como amigo"
  end

  it "destroys friendships from target users' profile" do
    click_link "agregar #{@friend.username} a tu lista de amigos"
    click_link "eliminar #{@friend.username} de tu lista de amigos"

    assert_content "Eliminado #{@friend.username} como amigo"
  end
end
