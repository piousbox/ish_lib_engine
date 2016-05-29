
class Paypal::Payment
  include Mongoid::Document
  include Mongoid::Timestamps

  # From: https://developer.paypal.com/docs/classic/ipn/gs_IPN/
  
=begin
// Assign payment notification values to local variables
$item_name        = $_POST['item_name'];
$item_number      = $_POST['item_number'];
$payment_status   = $_POST['payment_status'];
$payment_amount   = $_POST['mc_gross'];
$payment_currency = $_POST['mc_currency'];
$txn_id           = $_POST['txn_id'];
$receiver_email   = $_POST['receiver_email'];
$payer_email      = $_POST['payer_email'];
=end
  
end

