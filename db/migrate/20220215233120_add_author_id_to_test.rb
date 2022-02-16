class AddAuthorIdToTest < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :author, null: false, foreign_key: true
  end
end
