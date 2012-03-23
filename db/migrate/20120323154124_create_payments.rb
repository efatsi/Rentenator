class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :member_id
    	t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
