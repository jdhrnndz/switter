class CreateDoorTags < ActiveRecord::Migration
  def change
    create_table :door_tags do |t|
      t.text :doortag
      t.references :swit, index: true

      t.timestamps
    end
  end
end
