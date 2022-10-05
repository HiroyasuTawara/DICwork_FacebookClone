class Feed < ApplicationRecord
  mount_uploder :image, ImageUploader
  belongs_to :blog
end
