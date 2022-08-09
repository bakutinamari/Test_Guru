class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through :user_tests
  has_many :created_tests, class_name: "Test", foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: test_passages

  validates :name, presence :true
  validates :age, numericality : { only_integer :true }
	
  def tests_by_level(levels)
    tests.where(level: levels)
  end

  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end
end
