class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :solicitud, null: false, foreign_key: true
      t.integer :sol_id

      t.timestamps
    end
  end
end
