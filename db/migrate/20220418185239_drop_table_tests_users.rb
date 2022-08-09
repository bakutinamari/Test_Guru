class DropTableTestsUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :tests_users, if_exsists: true
  end
end
