class ProfilesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def show
    @user_profile = current_user
    @user_profile_books = current_user.books
  end

end