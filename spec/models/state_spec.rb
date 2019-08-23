require 'rails_helper'

RSpec.describe State, type: :model do
  it { should have_many (:parks) }
  it { should validate_presence_of :name }
end
