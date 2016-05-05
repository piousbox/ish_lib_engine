

#in lib/core_extensions.rb
class Hash
  
  ###
  ## So far the shit has been unnecessary
  ###
  
  #pass single or array of keys, which will be removed, returning the remaining hash
  def remove!(*keys)
    keys.each{|key| self.delete(key) }
    self
  end

  #non-destructive version
  def remove(*keys)
    self.dup.remove!(*keys)
  end
  
end
