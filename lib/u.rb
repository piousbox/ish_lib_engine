

class U
  
  
  def self.clean_name_seo g
    
    g[:name_seo] = CGI.escape(g[:name]).strip.
      gsub('_', '-').
      gsub('+', '-').
      gsub('.', '-').
      gsub("'", '').
      gsub(",", '')
      
    if g.save
      ;
    else
      flag = false
      old = g[:name_seo]
      c = 1
      while !flag
        g[:name_seo] += "-#{c.to_s}"
        flag = g.save
        c += 1
          
        break if c > 1000
          
      end
    end
    
  end
  
end

