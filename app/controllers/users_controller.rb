class UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :current_user, only: [:edit, :update, :destroy]

  def index
    filtered = User.search(params)
    @pagy, @users = pagy(filtered.all, items: 10)
  end

  def show
  end

  def new 
    @user = User.new
  end

  def add_user
    @user = User.new(user_params)

    if @user.save

      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    end
  end
  
  def destroy
    @user.destroy

    #redirect_to root_path, status: :see_other
    redirect_to users_url

  end

  private

  def user_params
    params.require(:user)
          .permit(:email, :password, :password_confirmation)
  end

  def current_user
    @user = User.find(params[:id])
  end
end
