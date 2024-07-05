class AddDiaToPublication < ActiveRecord::Migration[6.0]
  def change
    add_column :publications, :dia, :date
  end
end
