class Product < ActiveRecord::Base
	validates_presence_of :title, :message => "must not be blank"
	validates_presence_of :description, :message => "is blank"
	
	belongs_to :user
	has_and_belongs_to_many :categories
	has_many :comments

	scope :created, lambda { where("products.created_at IS NOT NULL") }
	scope :draft, lambda { where("products.created_at IS NULL") }
	scope :recent, lambda {where("products.created_at > ?", 1.week.ago.to_date)}
	scope :where_title, lambda { |term| where("products.title LIKE ?"  , "%#{term}%")}

	def long_title
		"#{title} - #{created_at}"
	end

	def created?
		created_at.present?
	end

	def owned_by?(owner)
		return false unless owner.is_a?(User)
		user == owner
	end
	
end
