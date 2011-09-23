class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.float :amount
      t.references  :user
      t.timestamps
    end
  end
end
