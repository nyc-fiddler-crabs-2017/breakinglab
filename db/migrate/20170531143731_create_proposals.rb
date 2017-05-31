class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :summary, null: false
      t.string :hypothesis, null: false
      t.references :proposer, foreign_key: true, null: false

      t.timestamps(null: false)
    end
  end
end
