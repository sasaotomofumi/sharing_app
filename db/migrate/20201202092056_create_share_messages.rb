class CreateShareMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :share_messages do |t|
      t.string     :content
      t.references :suggestion, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
