class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
    	t.integer :family_id
      t.string :name
      t.float :bills_paid, :default => 0
      t.float :balance, :default => 0


      t.timestamps
    end
  end
end
