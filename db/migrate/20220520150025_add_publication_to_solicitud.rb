class AddPublicationToSolicitud < ActiveRecord::Migration[6.0]
  def change
    add_reference :solicituds, :publication, null: false, foreign_key: true
  end
end
