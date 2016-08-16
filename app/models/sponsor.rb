class Sponsor < ApplicationRecord
  belongs_to :cause
  has_one :charge
end
