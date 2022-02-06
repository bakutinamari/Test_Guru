class Test < ApplicationRecord
  belongs_to :category

  

  def self.sort_title_tests(category)
    Test.where(category_id == category.id).order(id: :desc).pluck(:title) 
  end
end
