class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through :user_tests
	
  def tests_by_level(levels)
    tests.where(level: levels)
  end
end
