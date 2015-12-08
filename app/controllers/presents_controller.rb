class PresentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_present, only: [:edit, :update, :destroy]
  before_action :find_friend, only: [:index, :create, :new, :update]

  def index
    @presents = Friend.find(params[:friend_id]).presents
  end

  def show
  end

  def new
    @present = Friend.find(params[:friend_id]).presents.new
  end

  def create
    @present = Friend.find(params[:friend_id]).presents.new(present_params)

    # redirect_to friend_presents_path

    respond_to do |format|
      if @present.save
        format.html { redirect_to friend_presents_path, notice: 'present was successfully created.' }
        format.json { render :show, status: :created, location: @present }
      else
        format.html { render :new }
        format.json { render json: @present.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    p "^" * 80
    @present = Friend.find(params[:friend_id]).presents.find(params[:id])
    p "h" * 80
    p @present
  end

  def update
    @present = Friend.find(params[:friend_id]).presents.find(params[:id])
    p params
    p "xefs" * 10
    respond_to do |format|
      if @present.update(present_params)
        format.html { redirect_to friend_presents_path(@friend), notice: 'present was successfully updated.' }
        format.json { render :show, status: :ok, location: @present }
      else
        format.html { render :edit }
        format.json { render json: @present.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @present.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_present

  end

  def set_present
    @present = Present.find(params[:id])
    # @present = Friend.find(params[:friend_id]).presents.find(params[:id])
  end

  def find_friend
    @friend = Friend.find(params[:friend_id])
  end

  def present_params
    params.require(:present).permit(:title, :description, :price, :date_purchased)
  end
end
