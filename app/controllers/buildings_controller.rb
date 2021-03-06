class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(params[:building])
    if @building.save
      flash[:notice] = "Successfully created building."
      redirect_to buildings_path
    else
      render :action => 'new'
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    if @building.update_attributes(params[:building])
      flash[:notice] = "Successfully updated building."
      redirect_to buildings_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    flash[:notice] = "Successfully destroyed building."
    redirect_to buildings_path
  end
end
