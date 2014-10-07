class PaypalExpressController < ApplicationController
	before_filter :assigns_gateway

  include ActiveMerchant::Billing
  include PaypalExpressHelper
  def checkout
    # enter amount in parameter
    response = @gateway.setup_purchase(100000,
    :ip                => request.remote_ip,
    :return_url => url_for(:action => 'review', :only_path => false),
    :cancel_return_url => root_url,
  )
  p response
  p response.token
  redirect_to @gateway.redirect_url_for(response.token)
  end

  def review
     @juniors=Junior.where(:member_id => :current_member_id)
     if params[:token].nil?
      redirect_to root_url, :notice => 'Something went wrong!' 
      return
    end
 
    gateway_response = @gateway.details_for(params[:token])
 
    unless gateway_response.success?
      redirect_to root_url, :notice => "Something went wrong with the Paypal purchase. Here's what Paypal said: #{gateway_response.message}" 
      return
    end

     @juniors.has_paid=true;
 
    # @order_info = get_order_info gateway_response, @cart
  end
 

  private
    def assigns_gateway
      @gateway ||= PaypalExpressGateway.new(
        :login => PaypalLogin.login,
        :password => PaypalLogin.password,
        :signature => PaypalLogin.signature,
      )
    end
end
