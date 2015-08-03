class CreateCharCombats < ActiveRecord::Migration
  def change
    create_table :char_combats do |t|
      t.string :winner
      t.string :loser

      t.timestamps
    end
  end
end
