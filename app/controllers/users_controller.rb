class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allow_params)
    if @user.save
      flash[:success] = 'Created successfully'
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(allow_params)
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_path
  end

  private
    def allow_params
      params.require(:user).permit(:name, :age, :sex)
    end
end
