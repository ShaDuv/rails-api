require 'factory_bot_rails'

class Seed
  def self.begin
    State.destroy_all
    seed = Seed.new
    seed.generate_states_with_parks
  end

  def generate_states_with_parks
    100.times do
      FactoryBot.create(:state_with_parks)
    end
  end
end

Seed.begin
