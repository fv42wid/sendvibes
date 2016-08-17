class Sponsor < ApplicationRecord
  belongs_to :cause
  belongs_to :charge
  belongs_to :user
end
