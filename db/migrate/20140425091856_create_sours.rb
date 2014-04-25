class CreateSours < ActiveRecord::Migration
  def change
    create_table :sours do |t|
      t.string :voter
      t.references :swit, index: true

      t.timestamps
    end
  end
end
