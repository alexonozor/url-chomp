class CreateShorters < ActiveRecord::Migration
  def change
    create_table :shorters do |t|
      t.string :long_url
      t.string :short_url
      t.integer :click
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
