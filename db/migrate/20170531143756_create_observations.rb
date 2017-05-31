class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.string  :body, null: false
      t.integer :observable_id, null: false
      t.string  :observable_type, null: false
      t.references :observer, null: false

      t.timestamps(null: false)
    end
  end
end
