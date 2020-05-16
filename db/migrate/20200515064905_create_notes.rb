class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
