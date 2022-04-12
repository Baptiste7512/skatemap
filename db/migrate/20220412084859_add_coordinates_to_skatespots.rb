class AddCoordinatesToSkatespots < ActiveRecord::Migration[6.1]
  def change
    add_column :skatespots, :latitude, :float
    add_column :skatespots, :longitude, :float
  end
end
