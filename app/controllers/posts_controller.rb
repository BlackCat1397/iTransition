class PostsController < ApplicationController
  load_and_authorize_resource
  before_action only: [:show, :edit, :update, :destroy, :save]


  def new
    @post = Post.new
  end

  def post_params
    params.require(:post)
  end

  def show
  end

  def edit
  end

  def save
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_url, notice: 'Status was successfully created.' }
        format.json { render :show, status: :created, location: @status }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
  end

  def update
    @user.save(validate: false)
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'User was successfully updated.' }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
