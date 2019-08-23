class Park < ApplicationRecord
  belongs_to :place
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
end
