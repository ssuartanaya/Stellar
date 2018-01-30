class Reply < ApplicationRecord
  belongs_to :video
  belongs_to :user
  belongs_to :comment
end
