class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :photo
      t.boolean :admin
      t.string :medals

      t.timestamps null: false
    end
  end
end
