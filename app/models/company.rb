class Company < ActiveRecord::Base
	validates	:name, presence: true
	has_many :subsidiaries, class_name: "Company", foreign_key: "parent_id"
	belongs_to :parent, class_name: "Company"
end