class Park < ApplicationRecord
  belongs_to :state
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
end
