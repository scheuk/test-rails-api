class BillingController < ApplicationController

  before_filter :get_payment, :only => [:checkout, :paypal, :thank_you]

  def create
    @payment = Payment.new params[:payment]
    if @payment.save
      ## Paypal Checkout page
      #redirect_to :controller=>"billing", :action=>"checkout", :id => @payment.id
      redirect_to billing_url(@payment)
    else
      render :action => :new
    end
  end

  # ASSUMPTION   # payment is valid i.e. amount is entered
  def checkout
    response = @payment.setup_purchase(:ip => request.remote_ip,
                                       :description => "Donation",
                                       :return_url => confirm_paypal_url(@payment),
                                       :cancel_return_url => paymentform_url,
                                       :no_shipping => 1,
                                       :items => [{ :name => "Donation to #{@cause.name}",
                                                    :number => 1,
                                                    :quantity => 1,
                                                    :amount => @payment.amount * 100 }])
    redirect_to @payment.redirect_url_for(response.token)
  end

  def thank_you

  end

  ## CALL BACK
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

  private
  def get_payment
    @payment = Payment.find(params[:id])
    @cause = Cause.find(@payment.cause_id)
    @payment && @payment.valid? || invalid_url
  end
end
