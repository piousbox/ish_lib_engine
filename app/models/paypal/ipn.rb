
class Paypal::Ipn
  include Mongoid::Document
  include Mongoid::Timestamps

  field :raw_parameters, :type => String

end
