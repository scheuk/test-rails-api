class Api::V1::CausesController < ApplicationController
  respond_to :json, :xml
  def index
    @causes = Cause.all.cache
  end

  def show
    @cause = Cause.includes(:causeusers).find(params[:id])
  end

  def update
    cause = Cause.find params[:id]
    if cause.update_attributes params[:cause]
      @status = "success"
    else
      @status = "fail"
    end
  end

  def create
    Cause.create params[:cause]
  end
end
