class Quality < ApplicationRecord

	def self.search(search)  
    where("(quality_name) ILIKE ?", '%' + search + '%')
	end

end
