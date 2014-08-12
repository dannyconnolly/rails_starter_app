class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    @profile = current_user.profile
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
