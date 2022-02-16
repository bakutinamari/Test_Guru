class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author
  
  has_many :questions
  has_many :user_tests
  has_many :users, through :user_tests

  def self.sort_title_tests(title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title) 
  end
end
