class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :causes
  has_many :vibes

  def vibes_cause?(cause)
    cause.vibes.where(user_id: id).any?
  end
end
