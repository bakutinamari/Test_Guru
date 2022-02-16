class User < ApplicationRecord
	has_many :user_tests
	has_many :tests, through :user_tests
	
	def tests_by_level(levels)
	  self.joins("LEFT JOIN user_tests ON tests.id = test_id").where("tests.level = ?, user_tests.user_id = ?", levels, self.id)
	end
end
