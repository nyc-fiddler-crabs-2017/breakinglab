class CreateExperiments < ActiveRecord::Migration[5.1]
  def change
    create_table :experiments do |t|
      t.string :title, null: false
      t.string :status, null: false, default: "open"
      t.string :results
      t.string :conclusions
      t.references :experimenter
      t.references :proposal, null: false

      t.timestamps(null: false)
    end
  end
end

# <!-- </p>
# <%= f.hidden_field :proposal_id, :value => @proposal.id %>
# <p> -->
