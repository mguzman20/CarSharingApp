class AddHoraToPublication < ActiveRecord::Migration[6.0]
  def change
    add_column :publications, :hora, :string
  end
end
