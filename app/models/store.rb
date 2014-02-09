class Store < ActiveRecord::Base

  def self.search(search)
    if search
  	  where('name ILIKE :q OR city ILIKE :q OR state ILIKE :q OR state_abbr ILIKE :q OR zip ILIKE :q OR country ILIKE :q ', :q => "%#{search}%").
      order('city', 'name')
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

  def phone_number
    num = read_attribute(:phone_number)
    "#{num[0..2]}-#{num[3..5]}-#{num[6..9]}" if num
  end

  def phone_number=(phone_number)
    return unless phone_number
    write_attribute(:phone_number, phone_number.gsub(/[^0-9]/, ''))
  end
end