class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.index :username
      t.string :name
      t.string :email
      t.index :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
