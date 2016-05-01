
module RateMe

  def self.included(base)
    base.send :field, :n_upvotes, :type => Integer, :default => 1
    base.send :field, :n_downvotes, :type => Integer, :default => 0
    base.send :field, :upvoters, :type => Array, :default => [ 'anonymous' ]
    base.send :field, :downvoters, :type => Array, :default => []
  end
  
end


