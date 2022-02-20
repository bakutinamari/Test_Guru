class User < ApplicationRecord
  has_many :tests, class_name: "Test", foreign_key: :author_id
  has_many :user_tests, dependent: :destroy
  has_many :tests, through :user_tests
	
  def tests_by_level(levels)
    tests.where(level: levels)
  end
end
