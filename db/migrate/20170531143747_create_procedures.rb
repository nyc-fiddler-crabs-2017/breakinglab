class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :results, null: false
      t.string :conclusions, null: false
      t.references :experiment, foreign_key: true, null: false

      t.timestamps(null: false)
    end
  end
end
