class CreateCharTypes < ActiveRecord::Migration
  def change
    create_table :char_types do |t|
      t.string :title
			t.string :avatar
			
			t.references :user, index: true
			
      t.timestamps
    end
    #add_foreign_key :character_types, :users
  end
end
