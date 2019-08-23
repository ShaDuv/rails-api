class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :address
      t.string :city
      t.belongs_to :state, foreign_key: true
      t.timestamps
    end
  end
end
