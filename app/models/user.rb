class User < ApplicationRecord
	has_many :videos
	has_many :comments
	has_many :replies
	has_many :follows, foreign_key: :following

	acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :foto, FotoUploader
  mount_uploader :wall, WallUploader       
end
