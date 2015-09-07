class Project < ActiveRecord::Base
	def self.iron_find(number)
		where(id: number)
	end

	def self.clean_old(num_hours)
		limit_date = Time.now - num_hours.hours
		where("created_at < ?", limit_date).destroy_all
	end
end
