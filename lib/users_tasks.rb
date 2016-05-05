

class UsersTasks
  
  # arg is:::: username, email, group_id
  def self.create_from_user arg
    unless self.where(:username => arg[:username]).exists?
      NoUser.create :username => arg[:username],
        :group_id => arg[:group_id],
        :email => arg[:email]
      
    end
  end

  def self.import_old
    [
      [ 'becky', 'beckvelez01@hotmail.com'],
      [ 'Adeel_Ahmed', 'adeelpk_85@yahoo.com'],
      [ 'dine', 'aldine_33@hotmail.com'],
      [ 'Carmen', 'carmelein.ilustradora@gmail.com'],
      [ 'Hassan_Tariq', 'hawkarena@gmail.com'],
      [ 'lucia_chiappara', 'luciamchiappara@hotmail.com'],
      [ 'Stefanovski', 'zlio2004@yahoo.com'],
      [ 'Krysty_McIntyre', 'krystymcintyre@gmail.com'],
      [ 'Caroline', 'crlnjnsn@yahoo.ca'],
      [ 'Pavithra', 'pksjce@gmail.com'],
      [ 'Sulabh', 'sulabhjain.btech.itbhu@gmail.com'],
      [ 'Naomi_Csiki', 'hvvvj@yahoo.com'],
      [ 'Lori_Williams', 'suredog@q.com'],
      [ 'Chris_Henderson', 'thewritechris@usa.com'],
      [ 'Cherry_Vic_Patalita', 'bickie77@yahoo.com'],
      [ 'Natalie_Grigson', 'nataliegrigson@yahoo.com'],
      [ 'Caroline', 'crlnjnsn@yahoo.ca'],
      [ 'Jennifer_Sommer', 'Jennifer.Sommer1@marist.edu'],
      [ 'Eli_Terris', 'eliterris@gmail.com'],
      [ 'Sean_Smith', 'seansmith613@gmail.com'],
      [ 'Zachary_Kago', 'Zach_kago@yahoo.com'],
      [ 'Titanium', 'swissbezel@gmail.com'],
      [ 'Ashley_Shankle', 'polvati@gmail.com'],
      [ 'Sourya_Biswas', 'sourya.biswas@gmail.com'],
      [ 'sharon_farrer', 'farrersharon@yahoo.co.uk'],
      [ 'Kenneth_Okpomo', 'kokpomo@yahoo.com'],
      [ 'Megan', 'beatlerock9@aol.com'],
      [ 'kenneth_okpomo', 'kokpomo@yahoo.com'],
      [ 'macherie', 'charisse.cbl@gmail.com'],
      [ 'Platinum', 'iluxuryren@gmail.com'],
      [ 'Elizabeth_Varadan', 'elizabethvaradan@msn.com'],
      [ 'Mwila', 'mreadith@yahoo.com'],
      [ 'Siddharth_Sareen', 'sidsareen@gmail.com'],
      [ 'Nikki', 'nikkitraveling@gmail.com'],
      [ 'Sinead', 'taibhse7@hotmail.com'],
      [ 'salevoikerend', 'base18@spamelka.com'],
      [ 'GerAdegoAriff', 'd.danstrange1@yandex.ru'],
      [ 'ashutosh_ratnam', 'ashratnam@yahoo.com'],
      [ 'David_Harrison', 'davidnharrison@gmail.com'],
      [ 'oglyhytlainab8', 'pikavippi@live.com'],
      [ 'tating_y', 'tating_y@hotmail.com'],
      [ 'tarinapaco@msn.com', 'tarinapaco@msn.com'],
      [ 'bebz209', 'bebz209@gmail.com'],
      [ 'awarrygroorce', 'nobbiblyvor@gmail.com'],
      [ 'lizza_faith', 'lizzafaith22@yahoo.com'],
      [ 'Beauddyuttern', 'marcin.terluterson@gmail.com'],
      [ 'tamara_arden', 'tamarden@hotmail.com'],
      [ 'atherton', 'chrisbatherton@gmail.com'],
      [ 'wordsmith', 'ladyravenheartwordsmith@ladyravenheartwordsmith.org'],
      [ 'joshua_kean', 'jkean32123@hotmail.com'],
      [ 'lad', 'ladyravenheart@ladyravenheartwordsmith.org'] 
    ].each do |user|
      old = User.where( :email => user[1] ).first
      if old.blank?
        u = User.new
        u.email = user[1]
        u.username = user[0]
        u.name = user[0]
        u.password = "123#{user[1]}#{user[0]}"

        if u.save
          puts '+' unless Rails.env.test?
        else
          puts! u.errors
        end
        
      end
    end
  end
  
  
end
