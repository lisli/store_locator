class Store < ActiveRecord::Base


  def self.import(file)
    Store.destroy_all
    CSV.foreach(file.path, headers: true) do |row|
      Store.create! row.to_hash
    end
  end
end