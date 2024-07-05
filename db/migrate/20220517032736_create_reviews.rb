class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :calificacion
      t.string :contenido

      t.timestamps
    end
  end
end
