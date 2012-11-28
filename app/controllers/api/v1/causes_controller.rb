class Api::V1::CausesController < ApplicationController
  respond_to :json, :xml
  def index
    @causes = Cause.all.to_a
    respond_with @causes
  end

  def show
    cause = Cause.find params[:id]
    respond_with cause
  end

  def update
    cause = Cause.find params[:id]
    if task.update_attributes params[:task]
    else
    end
  end
end
