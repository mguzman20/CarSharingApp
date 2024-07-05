class RemoveDiaFromPublication < ActiveRecord::Migration[6.0]
  def change
    remove_column :publications, :dia, :string
  end
end
