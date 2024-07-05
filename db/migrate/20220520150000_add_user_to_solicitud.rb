class AddUserToSolicitud < ActiveRecord::Migration[6.0]
  def change
    add_reference :solicituds, :user, null: false, foreign_key: true
  end
end
