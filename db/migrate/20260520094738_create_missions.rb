class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.references :agent, null: false, foreign_key: true 
      t.string :title, null: false
      t.string :status, null: false

      t.timestamps
    end
    add_index :missions, :status
    
    add_check_constraint :missions, "status IN ('assigned', 'in_progress', 'completed')", name: "valid_mission_status"
  end
end