class Organization < ActiveRecord::Base
	  validates :name, presence: true, length: { in: 5..200 }
	  validates :description, presence: true, length: { in: 10..200 }
end
