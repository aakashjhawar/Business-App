class Party < ApplicationRecord

	def self.search(search)  
    where("(party_name) ILIKE ?", '%' + search + '%')
	end

end
