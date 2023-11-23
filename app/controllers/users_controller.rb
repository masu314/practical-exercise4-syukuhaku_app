class UsersController < ApplicationController
  # プロフィールページ
  def profile
    @user = current_user
  end

  # アカウントページ
  def account
    @user = current_user
  end
end
