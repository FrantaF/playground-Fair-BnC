class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  enum status: [:pending, :verified]
  mount_uploaders :photos, PhotosUploader
  serialize :photos, Array

end
