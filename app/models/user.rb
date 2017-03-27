class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interests

  enum role: { user: 0, admin: 1 }
  enum gender: %i(male female)

  self.roles.keys.each do |role|
    define_method "is_#{role}?" do
      self.role == role
    end
  end
end
