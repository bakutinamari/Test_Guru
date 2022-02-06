class Test < ApplicationRecord
  belongs_to :category

  attr_accessor :level, :title

  def initialize(level, title)
    @level = level
    @title = title
  end

  def self.sort_title_tests(category)
    Test.where(category_id == category.id).order(id: :desc).pluck(:title) 
  end
end
