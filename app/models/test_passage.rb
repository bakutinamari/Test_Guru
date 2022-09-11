# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  SUCCESS_RATE = 85

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if right_answer?(answer_ids)
    save!
  end

  def question_index
    test.questions.find_index(current_question) + 1
  end

  def number_of_questions
    test.questions.count
  end

  def passed_successfully?
    right_answers_percent >= SUCCESS_RATE
  end

  def current_question_number
    test.questions.where('id < ?', current_question.id).order(:id).first
  end

  def right_answers_percent
    (correct_questions.to_f / number_of_questions * 100.00).to_i
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_current_question
    self.current_question = if new_record?
                              test.questions.order(:id).first if test.present?
                            else
                              next_question
                            end
  end

  def next_question
    test.questions.order(:id).where('id < ?', current_question.id).order(:id).first
  end

  def right_answer?(answer_ids)
    right_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def right_answers
    current_question.answers.correct
  end
end
