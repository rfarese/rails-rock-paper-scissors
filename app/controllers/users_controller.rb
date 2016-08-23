class UsersController < ApplicationController
  before_action :require_login, only: :show

  def index
  end

  def show
    @user = current_user
  end
end
