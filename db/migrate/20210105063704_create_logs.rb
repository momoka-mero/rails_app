class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :brealfast
      t.string :lunch

      t.string :dinner

      t.string :goal_id

      t.string :comment

      t.string :user
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
