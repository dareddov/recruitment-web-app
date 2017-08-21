class Interest < ApplicationRecord
  enum interest_type: %i[health hobby work]

  belongs_to :user

  validates :name, :interest_type, presence: true

  scope :specific_scope, -> { where(interest_type: :health, user_id: User.young_women.select(:id)).where('name like ?', 'cosm%') }
end
