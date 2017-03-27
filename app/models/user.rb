class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :user]

  self.roles.keys.each do |role|
    define_method "is_#{role}?" do
      self.role == role
    end
  end
end
