class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string  :body, null: false
      t.integer :commentable_id, null: false
      t.string  :commentable_type, null: false
      t.references :commenter, null: false

      t.timestamps(null: false)
    end
  end
end
