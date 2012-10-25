class MischiffsController < ApplicationController
  respond_to :xml, :json
  def index
    @mischiffs = 'Hello World'
    respond_with @mischiffs
  end
  def show
    @mischiffs = 'Hello World2'
    respond_with @mischiffs
  end
end
