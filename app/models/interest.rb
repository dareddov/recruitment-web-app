class Interest < ApplicationRecord
  enum interest_type: %i[health hobby work]

  belongs_to :user

  validates :name, :interest_type, presence: true

  scope :health_interests, ->  { where(interest_type: Interest.interest_types[:health]) }
  scope :specific_scope, -> { health_interests.where(user_id: User.young_women.select(:id)).where('name like ?', 'cosm%') }
end
