class Store < ActiveRecord::Base

  def self.search(search)
    if search
  	  where('name ILIKE :q OR city ILIKE :q OR state ILIKE :q OR state_abbr ILIKE :q OR zip ILIKE :q OR country ILIKE :q ', :q => "%#{search}%")
  	else
  	  all
  	end
  end

  def self.import(file)
    Store.destroy_all
    CSV.foreach(file.path, headers: true) do |row|
      Store.create! row.to_hash
    end
  end
end