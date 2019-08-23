class State < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
