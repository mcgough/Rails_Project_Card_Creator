class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.text :name
      t.text :team
      t.text :position

      t.timestamps null: false
    end
  end
end
