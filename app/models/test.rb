class Test < ApplicationRecord
  belongs_to :category
  
  
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages

 # validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }

  scope :easy, -> { where(level(0..2)) }
  scope :middle, -> { where(level(2..4)) }
  scope :hard, -> { where(level(5..)) }
  scope :by_category_scope, -> (title){ 
                                  joins(:category)
                                  .where(categories: { title: title })
                                   .order(id: :desc) }

  def self.sort_title_tests(title)
    by_category_scope(title)
      .pluck(:title) 
  end
end
