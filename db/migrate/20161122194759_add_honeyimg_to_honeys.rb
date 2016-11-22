class AddHoneyimgToHoneys < ActiveRecord::Migration[5.0]
  def change
    add_column :honeys, :honeyimg, :string
  end
end
