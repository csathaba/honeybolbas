class AddOrientationLandscapeToHoneys < ActiveRecord::Migration[5.0]
  def change
    add_column :honeys, :orientation_landscape, :boolean, :default => false
  end
end
