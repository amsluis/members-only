class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :rememeber_token, :remember_digest
  end
end
