class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :type, null: false
      t.string :model
      t.string :condition
      t.integer :point_cost, null: false
      t.boolean :availability
      t.references :user

      t.timestamps null: false
    end
  end
end
