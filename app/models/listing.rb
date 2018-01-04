class Listing < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :verified]
end
