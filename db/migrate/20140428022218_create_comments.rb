class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :commenter
      t.references :swit, index: true

      t.timestamps
    end
  end
end
