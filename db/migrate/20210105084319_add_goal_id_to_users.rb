class AddGoalIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :goal_id, :string
  end
end
