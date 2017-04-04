class Interest < ApplicationRecord
  enum interest_type: %i(health hobby work)

  belongs_to :user
end
