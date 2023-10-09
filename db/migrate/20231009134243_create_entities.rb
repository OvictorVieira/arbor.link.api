class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :entity_type
      t.string :inep
      t.references :parent, foreign_key: { to_table: :entities, null: true }

      t.timestamps
    end
  end
end
