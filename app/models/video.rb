class Video < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :replies, dependent: :destroy

	acts_as_votable

	mount_uploader :thumbnail, ThumbnailUploader
	mount_uploader :video, VideoUploader
end
