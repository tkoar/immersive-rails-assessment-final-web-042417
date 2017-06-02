class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @appearance.user_id = current_user.id
    if @appearance.save
      redirect_to @appearance.episode
    else
      render :new
    end
  end

  def show
    find_appearance
  end

  def edit
    find_appearance
  end

  def update
    find_appearance
    if @appearance.update(appearance_params)
      redirect_to appearance_path(@appearance)
    else
      render :edit
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

  def find_appearance
    @appearance = Appearance.find(params[:id])
  end

end
