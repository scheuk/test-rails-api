class Payment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: String
  field :amount, type: Float
  field :transaction_number, type: String
  belongs_to :cause

  PROCESSING, FAILED, SUCCESS = 1, 2, 3

  validates :amount, :presence => true, :numericality => { :greater_than => 0 }

  def self.conf
    @@gateway_conf ||= YAML.load_file(Rails.root.join('config/gateway.yml').to_s)[Rails.env]
  end

  ## Paypal
  def setup_purchase(options)
    gateway.setup_purchase(amount * 100, options)
  end

  def redirect_url_for(token)
    gateway.redirect_url_for(token)
  end

  def purchase(options={})
    self.status = PROCESSING
    #:ip       => request.remote_ip,
    #:payer_id => params[:payer_id],
    #:token    => params[:token]
    response = gateway.purchase(amount * 100, options)
    logger.debug "new response: #{response.inspect}"
    if response.success?
      logger.debug "transaction successful: #{SUCCESS}"
      self.transaction_number = response.params['transaction_id']
      self.status = SUCCESS
    else
      logger.debug "transaction failed: #{FAILED}"
      self.status = FAILED
    end
    return self
  #rescue Exception => e
  #  self.status = FAILED
  #  return self
  end

  private
  def gateway
    ActiveMerchant::Billing::Base.mode = auth['mode'].to_sym
    ActiveMerchant::Billing::PaypalExpressGateway.new(
        :login => auth['login'], :password => auth['password'],
        :signature => auth['signature'])
  end

  def auth
    self.class.conf
  end
end
