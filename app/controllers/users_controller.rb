class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    #puts "TESTING:  #{@user.inspect()}" 
    #This will appear in the rails server output or rspec output
  end
  
  def create
    @user = User.new(params[:user])
    
    #puts "TESTING: #{params.inspect}"
    
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
end
