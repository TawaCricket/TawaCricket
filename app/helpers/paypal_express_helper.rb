module PaypalExpressHelper
	def get_setup_purchase_params(cart, request)
    subtotal, shipping, total = get_totals(cart)
    return to_cents(total), {
      :ip => request.remote_ip,
      :return_url => url_for(:action => 'review', :only_path => false),
      :cancel_return_url => "",
      # :subtotal => to_cents(subtotal),
      :subtotal => 1000,
      # :shipping => to_cents(shipping),
      # :handling => 0,
      # :tax =>      0,
      # :allow_note =>  true,
      # :items => get_items(cart),
    }
  end

   def get_order_info(gateway_response, cart)
   
  end
 
  def get_shipping(cart)
   
  end
 
  def get_items(cart)
   
    end
  
 
  def get_totals(cart)
  
  end
 
  def to_cents(money)
   
  end
end
