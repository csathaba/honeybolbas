class AddRankToHoneys < ActiveRecord::Migration[5.0]
  def change
    add_column :honeys, :rank, :integer
  end
end
