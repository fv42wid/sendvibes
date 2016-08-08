class Cause < ApplicationRecord
  belongs_to :user
  has_many :vibes
end
