class Api::V1::CausesController < ApplicationController
  respond_to :json, :xml
  def index
    @causes = Cause.all.to_a
    respond_with @causes
  end
end
