class PaypalLogin < Settingslogic
 	source "#{Rails.root}/config/paypal_login.yml"
    namespace Rails.env
end
