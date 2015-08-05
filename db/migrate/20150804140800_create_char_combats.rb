class CreateCharCombats < ActiveRecord::Migration
  def change
    create_table :char_combats do |t|
      t.string :first_combatant
      t.string :second_combatant
      t.string :winner

      t.timestamps
    end
  end
end
