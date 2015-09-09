class Project < ActiveRecord::Base
	has_many :entries

	validates :title, uniqueness: true
	validates :title, presence: true
	validates :title, length: { maximum: 30 }

	def self.last_updated(num_limit)
		order(:created_at).limit(num_limit)
	end

end
