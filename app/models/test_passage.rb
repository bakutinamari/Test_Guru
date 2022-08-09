class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question',optional: true

  SUCCESS_RATE = 85

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_question += 1 if right_answer?(answer_ids)

    save!
  end

  def number_of_questions
    test.questions.count 
  end

  def current_question_number
    test.questions.order(:id).where('id < ?',current_question.id).size + 1
  end

  def right_answers_percent
    (correct_answers.to_f / number_of_questions * 100.00).to_i
  end

  def completed?
    current_question.nil?
  end

  def passed_successfully?
    right_answers_percent >= SUCCESS_RATE
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def right_answer?(answer_ids)
    right_answers.ids.sort == answer_ids.map(&:to_i).sort
    false if answer_ids.blank?
  end

  def right_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id>?',current_question.nil? ? 0 :current_question.id).first
  end
end