class UsersController < ApplicationController
    before_action :current_user, only [:show, :edit, :update, :destroy]


    def index
        @users = User.all.order(:id)
    end

    def show
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            @user.cart.create!

            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @current_user.update(user_params)
            redirect_to @current_user
        end
    end
    
    def destroy
        @current_user.destroy

        #redirect_to root_path, status: :see_other
    end

    private

    def user_params
        params.require(:user)
              .permit(:first_name, :name, :phone_number, :email)
    end

    def current_user
        @current_user = User.find(params[:id])
    end

    def check_admin
        
    end
end
