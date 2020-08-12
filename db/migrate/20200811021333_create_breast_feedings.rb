class CreateBreastFeedings < ActiveRecord::Migration[6.0]
  def change
    create_table :breast_feedings do |t|
      t.float :quantity
      t.float :duration
      t.references :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
