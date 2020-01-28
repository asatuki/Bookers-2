class UsersController < ApplicationController

	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
    @books = @user.books
  	@newbook = Book.new
  end

  def index
    @user = current_user
    @newbook = Book.new
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
       flash[:book] = "You have updated user successfully."
     else
       flash[:book] = "error!"
       render 'edit'
       end
    end


  def edit
  	@user = User.find(params[:id])
  end



private
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end

def correct_user
  user = User.find(params[:id])
  if current_user != user
     redirect_to user_path(current_user.id)
  end
end

end
