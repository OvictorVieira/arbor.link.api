class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :entity_type
      t.string :inep
      t.integer :parent_id

      t.timestamps
    end
    add_index :entities, :parent_id
  end
end
