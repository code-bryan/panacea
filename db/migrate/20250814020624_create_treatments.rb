class CreateTreatments < ActiveRecord::Migration[8.0]
  def change
    create_table :treatments do |t|
      t.references :appointment, null: false, foreign_key: true
      t.text :description
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
