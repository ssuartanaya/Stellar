class User < ApplicationRecord
	has_many :videos
	has_many :comments
	has_many :replies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :foto, FotoUploader       
end
