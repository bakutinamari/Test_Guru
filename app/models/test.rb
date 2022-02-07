class Test < ApplicationRecord
  belongs_to :category

  def self.sort_title_tests(category)
    Test.joins("LEFT JOIN categories ON tests.category_id = categories.id")
      .where("categories.title = ?",category).order(id: :desc).pluck(:title) 
  end
end
