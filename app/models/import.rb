class Import < ApplicationRecord

	def self.update(e)
		s = Import.new(:state => e)
		s.save
		puts "Listado de importaciones ****************> #{e}"
		puts 
	end

end
