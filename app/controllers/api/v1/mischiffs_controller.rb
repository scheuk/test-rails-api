class Api::V1::MischiffsController < ApplicationController
  respond_to :json, :xml
  def index
    @mischiffs = Mischiff.all.to_a
    respond_with @mischiffs
  end
end
