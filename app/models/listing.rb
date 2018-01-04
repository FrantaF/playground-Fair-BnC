class Listing < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :verified]
  mount_uploaders :photos, PhotosUploader
  serialize :photos, Array
end
