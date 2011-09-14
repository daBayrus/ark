class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string  :email     # Primary email of the user to be used for email notifications

      t.timestamps
    end

    create_table :authentications do |t|
      t.references :user

      t.string :provider   # auth provider
      t.string :token      # cache auth token
      t.string :uid        # user id set by auth provider
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :authentications
  end
end
