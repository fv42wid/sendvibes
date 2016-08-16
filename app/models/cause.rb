class Cause < ApplicationRecord
  belongs_to :user
  has_many :vibes
  has_many :comments, :as => :commentable
  has_many :sponsors
  has_many :charges, :as => :chargeable
end
