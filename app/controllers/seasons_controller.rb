class SeasonsController < ApplicationController

  def new_form
    @season = Season.new
    render :partial => 'form', :layout => false
  end

  def create
    @season = Season.new(season_params)
    respond_to do |format|
      if @season.save
        format.html { redirect_to @season, notice: 'Season was successfully created.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  def season_params
    params.require(:season).permit(:year)
  end
end
