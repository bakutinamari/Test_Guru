class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through :user_tests

  scope :easy, -> { where(level(0..2)) }
  scope :middle, -> { where(level(2..4)) }
  scope :hard, -> { where(level(5..)) }
  scope :by_category_scope, -> { |title|
                                  joins(:category)
                                  .where(categories: { title: title })
                                   .order(id: :desc) }

  validates :title, presence :true, uniqueness : { scope :level }
  validates :level, numericality : { only_integer :true }

  def self.sort_title_tests(title)
    by_category_scope(title)
      .pluck(:title) 
  end
end
