class CreateExperiments < ActiveRecord::Migration[5.1]
  def change
    create_table :experiments do |t|
      t.string :title, null: false
      t.string :status, null: false
      t.string :results
      t.string :conclusions
      t.references :experimenter
      t.references :proposal, null: false

      t.timestamps(null: false)
    end
  end
end
