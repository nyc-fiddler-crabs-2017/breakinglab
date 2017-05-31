class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :steps
      t.references :experiment

      t.timestamps(null: false)
    end
  end
end
