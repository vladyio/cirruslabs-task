class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators do |t|
      t.references :ticket, foreign_key: true
      t.string :company_name, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
