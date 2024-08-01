class AddUserRefToCvs < ActiveRecord::Migration[7.0]
  def change
    add_reference :cvs, :user, null: false, foreign_key: true
  end
end
