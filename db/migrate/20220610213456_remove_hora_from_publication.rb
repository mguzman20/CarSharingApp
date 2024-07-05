class RemoveHoraFromPublication < ActiveRecord::Migration[6.0]
  def change
    remove_column :publications, :hora, :integer
  end
end
