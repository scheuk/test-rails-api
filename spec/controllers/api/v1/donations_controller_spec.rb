require 'spec_helper'

describe Api::V1::DonationsController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'paypal'" do
    it "returns http success" do
      get 'paypal'
      response.should be_success
    end
  end

end
