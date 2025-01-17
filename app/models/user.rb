class User < ApplicationRecord
  has_many :cases
  has_many :reports
  belongs_to :district, optional: true
  belongs_to :state

  enum role: [:user, :rki, :admin, :arzt, :labor, :ga, :ls]
  after_initialize :set_default_role, if: :new_record?

   def set_default_role
     self.role ||= :user
   end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
