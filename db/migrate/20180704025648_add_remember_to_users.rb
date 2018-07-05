class AddRememberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rememeber_token, :string
  end
end
