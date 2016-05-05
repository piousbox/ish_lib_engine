
class String
  
  def to_simple_string
    a = self.gsub("\.", '-')
    a = a.gsub(':', '-').gsub('%20', '-')
    a = a.downcase.strip.gsub(' ', '-')
    while a.include? '--'
      a = a.sub("--", '-')
    end
    a = a.gsub(/-$/, '')
    a
  end
  
end