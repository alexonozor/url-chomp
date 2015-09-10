class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :country
      t.string :device
      t.string :refferer
      t.integer :shorter_id

      t.timestamps null: false
    end
  end
end
