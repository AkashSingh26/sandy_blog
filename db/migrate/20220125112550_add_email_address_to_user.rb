class AddEmailAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_address, :string, null: true
  end
end
