class DropTableUserTests < ActiveRecord::Migration[7.0]
  def up
    drop_table :user_tests
  end
end
