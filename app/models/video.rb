class Video < ApplicationRecord
	belongs_to :user

	mount_uploader :thumbnail, ThumbnailUploader
	mount_uploader :video, VideoUploader
end
