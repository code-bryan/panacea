class CreateAbilities < ActiveRecord::Migration[8.0]
  def change
    create_table :abilities do |t|
      t.string :action
      t.string :subject
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
