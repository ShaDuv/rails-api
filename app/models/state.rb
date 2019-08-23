class State < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
end
