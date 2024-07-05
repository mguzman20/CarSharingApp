class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :dia
      t.string :salida
      t.integer :hora
      t.string :tipo
      t.integer :limite
      t.string :direccion

      t.timestamps
    end
  end
end
