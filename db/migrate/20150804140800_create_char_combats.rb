class CreateCharCombats < ActiveRecord::Migration
  def change
    create_table :char_combats do |t|
      t.integer :first_combatant_id
      t.integer :second_combatant_id
      t.integer :winner

      t.timestamps
    end
  end
end
