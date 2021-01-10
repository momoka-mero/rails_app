class AddTargetIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :target_id, :integer
  end
end
