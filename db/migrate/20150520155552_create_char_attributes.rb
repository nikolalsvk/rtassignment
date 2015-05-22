class CreateCharAttributes < ActiveRecord::Migration
  def change
    create_table :char_attributes do |t|
      t.string :title
      t.integer :value
      t.string :icon
      t.references :char_type, index: true

      t.timestamps
    end
  end
end
