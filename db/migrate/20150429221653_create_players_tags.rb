class CreatePlayersTags < ActiveRecord::Migration
  def change
    create_table :players_tags do |t|
      t.references :player, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :players_tags, :players
    add_foreign_key :players_tags, :tags
  end
end
