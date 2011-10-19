class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.timestamps
    end

    create_table :authentications do |t|
      t.references :user

      t.string :provider   # auth provider
      t.string :token      # cache auth token
      t.string :uid        # user id set by auth provider
      t.string :name
      t.string :email
      t.string :avatar_url
      t.string :location

      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :authentications
  end
end
