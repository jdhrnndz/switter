class CreateSwits < ActiveRecord::Migration
  def change
    create_table :swits do |t|
      t.text :text
      t.string :poster

      t.timestamps
    end
  end
end
