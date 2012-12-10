class Api::V1::GfgusersController < ApplicationController

  respond_to :json, :xml

  def create
    Gfguser.create params[:gfguser]
  end

  def update
    gfguser = Gfguser.find params[:id]
    if gfguser.update_attributes params[:gfguser]
      @status = "success"
    else
      @status = "fail"
    end
  end

  def show
    @gfguser = Gfguser.includes(:causeusers).find params[:id]
  end

  def fbid
    @gfguser = Gfguser.includes(:causeusers).where(fbid: params[:fbid]).first
    logger.debug @gfguser.inspect
  end
end
