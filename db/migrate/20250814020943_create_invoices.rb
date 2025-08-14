class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.decimal :total_amount
      t.string :status
      t.date :due_date

      t.timestamps
    end
  end
end
