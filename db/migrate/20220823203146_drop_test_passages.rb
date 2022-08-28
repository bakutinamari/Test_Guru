class DropTestPassages < ActiveRecord::Migration[7.0]
  def change
    drop_table :test_passages
    
  end
end
