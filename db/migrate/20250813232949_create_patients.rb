class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :phone
      t.string :email
      t.string :address
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
