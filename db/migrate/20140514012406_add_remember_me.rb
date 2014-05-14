class AddRememberMe < ActiveRecord::Migration
  def self.up
    add_column :authors, :remember_me_token, :string, :default => nil
    add_column :authors, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :authors, :remember_me_token
  end

  def self.down
    remove_index :authors, :remember_me_token

    remove_column :authors, :remember_me_token_expires_at
    remove_column :authors, :remember_me_token
  end
end
