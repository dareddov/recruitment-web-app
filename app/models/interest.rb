class Interest < ApplicationRecord
  enum interest_type: %i(health hobby work)

  belongs_to :user

  validates :name, :interest_type, presence: true
end
