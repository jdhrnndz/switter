class CreateSweets < ActiveRecord::Migration
  def change
    create_table :sweets do |t|
      t.string :voter
      t.references :swit, index: true

      t.timestamps
    end
  end
end
