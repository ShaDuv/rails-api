require 'rails_helper'

RSpec.describe Park, type: :model do
  it { should belong_to(:state) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
end
