class AddDescriptionHuToHoneys < ActiveRecord::Migration[5.0]
  def change
    add_column :honeys, :description_hu, :text
  end
end
