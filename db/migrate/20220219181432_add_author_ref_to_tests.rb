class AddAuthorRefToTests < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :author, foreign_key: true
  end
end
