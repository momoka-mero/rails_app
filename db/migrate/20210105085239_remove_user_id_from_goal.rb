class RemoveUserIdFromGoal < ActiveRecord::Migration[6.0]
  def change
    remove_column :goals, :user_id, :integer
  end
end
