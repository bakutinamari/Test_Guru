class User < ApplicationRecord
	
	def tests_by_level(levels)
       self.joins("LEFT JOIN user_tests ON tests.id = test_id").where(tests.level = ?,user_tests.user_id = ?, levels, users)
	end
       
end