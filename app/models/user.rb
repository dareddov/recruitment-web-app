class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: { user: 0, admin: 1 }
  enum gender: %i[male female]

  has_many :interests
  accepts_nested_attributes_for :interests, allow_destroy: true

  validates :gender, :age, presence: true

  scope :young_women, -> { where('age between ? and ? and gender = ?', 20, 30, 1) }

  self.roles.keys.each do |role|
    define_method "is_#{role}?" do
      self.role == role
    end
  end
end
