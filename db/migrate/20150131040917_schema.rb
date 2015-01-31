class Schema < ActiveRecord::Migration
  def change

    # Creating addresses table
    create_table :addresses do |t|
      t.string :city, limit: 200
      t.string :state, limit: 35
      t.string :country, limit: 2

      t.timestamps null: false
    end

    # Creating preferences table
    create_table :preferences do |t|
      t.boolean :share_email
      t.boolean :share_phone

      t.timestamps null: false
    end

    # Creating clubs table
    create_table :clubs do |t|
      t.string :name, limit: 100
      t.date :founded
      t.references :address, index: true

      t.timestamps null: false
    end

    # Creating scouts table
    create_table :scouts do |t|
      t.references :user, index: true
      t.references :club, index: true

      t.timestamps null: false
    end

    # Creating athletes table
    create_table :athletes do |t|
      t.references :user, index: true
      t.date :birthday
      t.float :height, precision: 3, scale: 2
      t.float :weight, precision: 3, scale: 2
      t.boolean :allow_to_travel
      t.integer :foot, index: true
      t.integer :position, index: true

      t.timestamps null: false
    end

    # Creating authorizations table
    create_table :authorizations do |t|
      t.string :provider, limit: 20
      t.string :uid
      t.integer :user_id
      t.string :token
      t.string :secret
      t.string :username, limit: 40

      t.timestamps null: false
    end

    # Creating users table
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      t.string :name, limit: 30
      t.string :last_name, limit: 30
      t.string :phone, limit: 14
      t.text :bio
      t.string :user_type, limit: 7
      t.string :image
      t.references :address
      t.references :preference

      t.timestamps null: false
    end

    # foreign_keys
    add_foreign_key :users, :preferences
    add_foreign_key :users, :addresses
    add_foreign_key :clubs, :addresses
    add_foreign_key :scouts, :users
    add_foreign_key :scouts, :clubs
    add_foreign_key :athletes, :users

    # indexes
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
  end
end
