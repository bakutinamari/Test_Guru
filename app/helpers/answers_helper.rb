# frozen_string_literal: true

module AnswersHelper
  def result_color(test_passage)
    test_passage.passed_successfully? ? 'success' : 'fail'
  end

  def result_massage(test_passage)
    correct_answers = test_passage.correct_answers
  end
end
