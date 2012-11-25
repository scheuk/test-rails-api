class Api::V1::DonationsController < ApplicationController

  respond_to :xml, :json

  before_filter :get_payment, :only => [:show, :paypal, :cancel]

  def index
  end

  def create
    @payment = Payment.new params[:payment]
    if @payment.save
      @cause = Cause.find(@payment.cause_id)
      response = @payment.setup_purchase(:ip => request.remote_ip,
                                         :description => "Donation",
                                         :return_url => confirm_donation_url(@payment),
                                         :cancel_return_url => cancel_donation_url(@payment),
                                         :no_shipping => 1,
                                         :items => [{ :name => "Donation to #{@cause.name}",
                                                      :number => 1,
                                                      :quantity => 1,
                                                      :amount => @payment.amount * 100 }])
      output = {:id => "#{@payment.id}", :redirect_url => "#{@payment.redirect_url_for(response.token)}"}
      #logger.debug "@output: #{@output.inspect}"
      #respond_with(@output)
      respond_to do |format|
        format.json{render :json => output.to_json}
        format.xml{render :json => output.to_xml}
      end
    else
      render :text => "Error Creating Payment"
    end
  end

  def show
    output = {:id => @payment.id, :status => @payment.status}
    respond_to do |format|
      format.json{render :json => output.to_json}
      format.xml{render :json => output.to_xml}
    end
  end

  def paypal
    @payment = @payment.purchase(:token => params[:token], :payer_id => params[:PayerID], :ip => request.remote_ip)
    @payment.save
    #logger.debug "Payment Object: #{@payment.inspect}"
    if @cause.donations.nil?
      @cause.donations = @payment.amount
    else
      @cause.donations = @cause.donations + @payment.amount
    end
    @cause.save
    redirect_to billing_thank_you_url(@payment)
    #redirect_to :controller => "billing", :action => "checkout", :id => @payment.id
  end

  def cancel
    if @payment.status == "3"
      output = {:error => "error"}
      respond_to do |format|
        format.json{render :json => output.to_json}
        format.xml{render :json => output.to_xml}
      end
    else
      @payment.update_attribute(:status, "4")
      redirect_to billing_thank_you_url(@payment)
    end
  end

  private
  def get_payment
    @payment = Payment.find(params[:id])
    @cause = Cause.find(@payment.cause_id)
    @payment && @payment.valid? || invalid_url
  end

end
