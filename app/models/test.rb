class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through :user_tests

  def self.sort_title_tests(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title) 
  end
end
