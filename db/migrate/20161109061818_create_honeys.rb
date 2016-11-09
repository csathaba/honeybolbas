class CreateHoneys < ActiveRecord::Migration[5.0]
  def change
    create_table :honeys do |t|
      t.string :name
      t.text :description_en
      t.text :description_de

      t.timestamps
    end
  end
end
