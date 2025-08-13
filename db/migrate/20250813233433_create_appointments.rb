class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.datetime :scheduled_at
      t.integer :status
      t.text :notes
      t.references :company, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :dentist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
