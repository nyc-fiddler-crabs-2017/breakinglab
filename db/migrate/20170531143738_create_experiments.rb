class CreateExperiments < ActiveRecord::Migration[5.1]
  def change
    create_table :experiments do |t|
      t.string :status, null: false
      t.references :experimenter
      t.references :proposal, null: false

      t.timestamps(null: false)
    end
  end
end
