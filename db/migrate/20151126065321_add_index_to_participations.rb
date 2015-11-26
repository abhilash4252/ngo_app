class AddIndexToParticipations < ActiveRecord::Migration
  def change
    add_index :participations, [:user_id,:event_id], unique: true
  end
end
