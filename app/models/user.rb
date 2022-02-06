class User < ApplicationRecord
	def all_tests(test)
		test.title
	end

	def tests_by_level(levels)
       all_tests self if levels == test.level
       title.each{|title| puts title}
	end
end
