class UsersController < ApplicationController
  def index
    render json: { 'name' => 'Tony'}
  end

  def create
    render text: "I'm in the create action"
  end

  def show
    render text: "I'm in the show action"
  end
end
