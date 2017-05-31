class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :results, null: false
      t.string :conclusions, null: false
      t.belongs_to :experiment , index: true

      t.timestamps(null: false)
    end
  end
end
