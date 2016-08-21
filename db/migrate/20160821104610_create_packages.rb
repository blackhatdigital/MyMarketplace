class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :sample_required
      t.integer :timeframe_days
      t.integer :audience_size
      t.integer :target_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
