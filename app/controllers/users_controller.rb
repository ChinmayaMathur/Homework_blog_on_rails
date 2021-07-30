class UsersController < ApplicationController
      before_action :find_user, only: [:edit, :update, :changePassword, :updatePassword]

      def new
            @user = User.new
      end

      def create
            @user = User.new user_params
            if @user.save
                  session[:user_id] = @user.id
                  redirect_to root_path, notice: "Logged in!"
            else
                  render :new
            end
      end

      def edit
      end

      def update
            if @user.update user_params
                  redirect_to root_path
            else
                  render :edit
            end
      end

      def changePassword
      end

      def updatePassword
            u = params[:user]
            # puts u[:current_password]
            if @user.authenticate(u[:current_password]) && u[:new_password] == u[:new_password_confirmation] && u[:new_password] != u[:current_password]
                  @user.password = u[:new_password]
                  @user.save
                  redirect_to root_path, notice: "Changed Password!"
            else
                  render :changePassword, notice: "Password doesn't match, try again!"
            end

      end

      private

      def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)  
      end

      def find_user
            @user = current_user
      end

end