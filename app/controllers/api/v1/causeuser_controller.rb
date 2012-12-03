class Api::V1::CauseuserController < ApplicationController
  respond_to :json, :xml
  def update
    causeuser = Causeuser.find params[:id]
    if causeuser.update_attributes params[:causeuser]
      @status = "success"
    else
      @status = "fail"
    end
  end

  def create
    Causeuser.create params[:causeuser]
  end
end
