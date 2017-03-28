class Interest < ApplicationRecord
  enum interest_type: %i(health hobby work)

  belongs_to :user

  validates :name, :interest_type, presence: true

  scope :health_type, -> { where(interest_type: :health) }
  scope :specific_scope, -> { health_type.joins(:user).where(user_id: User.young_women.select(:id)).where('name like ?', 'cosm%') }
end
