# frozen_string_literal: true

class DropTableUserTests < ActiveRecord::Migration[7.0]
  def up
    drop_table :user_tests, if_exsists: true
  end
end
