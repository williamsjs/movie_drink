class ChangePasswordDigest < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :password_digest, :password
    end
  end
end
