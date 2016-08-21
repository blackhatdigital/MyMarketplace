class Order < ActiveRecord::Base
	belongs_to :package
	belongs_to :buyer, class_name: "User"
	belongs_to :advocate, class_name: "User"
end
