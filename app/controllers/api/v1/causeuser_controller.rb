class Api::V1::CauseuserController < ApplicationController
  respond_to :json, :xml
  def update
    #logger.debug request.raw_post
    #logger.debug params.inspect
    causeuser = Causeuser.find params[:id]
    if causeuser.update_attributes params[:causeuser]
      @status = "success"
    else
      @status = "fail"
    end
  end

  def create
    #logger.debug request.raw_post
    #logger.debug params.inspect
    Causeuser.create params[:causeuser]
  end
end
