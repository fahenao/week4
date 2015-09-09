class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
    	t.integer :project_id
    	t.integer :hour
    	t.integer :minute
    	t.text :comment
    	t.datetime :date
      	t.timestamps
    end
  end
end
