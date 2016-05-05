
class AddressbookitemsTasks

  def self.to_mongoid

    p = User.where( :username => 'piousbox' ).first
    
    olds = SqlAddressbookitems.find :all
    olds.each do |old|

      if 0 == Addressbookitem.where( :name => old.name ).length

        new = Addressbookitem.new
        new.name = old.name
        new.descr = old.descr
        new.user = p

        new.created_at = old.created_at
        new.updated_at = old.updated_at

        if new.save
          puts '+'
        else
          puts new.errors.inspect
        end

      end

    end

  end

end