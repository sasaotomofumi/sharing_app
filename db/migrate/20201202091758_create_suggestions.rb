class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.string :content,  null: false 
      t.string :purpose,  null: false
      t.text   :detail,   null: false
      t.string :deadline, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
