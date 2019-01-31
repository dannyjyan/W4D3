class UsersController < ApplicationController
  
  def new
    @user = User.new
    render :new 
  end 

  def create
    @user = User.new(user_params) 
    
    if @user && @user.save 
      #login?
      # redirect_to :show
      render json: @user
    else 
      flash[:errors] = user.error.full_messages
      render :new
    end 
  end 

  def show  
    @user = User.find(params[:id])  
    # render json: params
    render :show
  end 

  def index 
    @users = User.all
  end  

  private 
  def user_params
    params.require(:user).permit(:user_name, :password)
  end  
end 