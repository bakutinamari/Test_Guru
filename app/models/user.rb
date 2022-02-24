class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :author_id
  has_many :user_tests, dependent: :destroy
  has_many :tests, through :user_tests

  validates :name, presence :true
  validates :age, numericality : { only_integer :true }
	
  def tests_by_level(levels)
    tests.where(level: levels)
  end
end
