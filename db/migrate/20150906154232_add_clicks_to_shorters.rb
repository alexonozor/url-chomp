class AddClicksToShorters < ActiveRecord::Migration
  def change
    add_column :shorters, :clicks, :integer, default: 0
  end
end
