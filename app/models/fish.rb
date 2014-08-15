class Fish < ActiveRecord::Base
	belongs_to :user

	mount_uploader :attachment, AttachmentUploader

	def owned_by?(owner)
		return false unless owner.is_a?(User)
		user == owner
	end

	def caught_by
		return user.profile.name
	end
end
