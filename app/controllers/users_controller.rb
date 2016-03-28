class UsersController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
      user = User.find_by_id(params[:id])
      if user
        render json: user
      else
        render(
          text: "User not found", status: :not_found
        )
      end
  end

  def update
    user = User.find_by_id(params[:id])
    if user
      user.update(user_params)
      render json: user
    else
      render(
        text: "User not found", status: :not_found
      )
    end
  end

  def destroy
    User.delete(params[:id])
    render text: "It was deleted"
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
