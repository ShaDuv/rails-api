class Park < ApplicationRecord
  belongs_to :place, dependent: :destroy
end
