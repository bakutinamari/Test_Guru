class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_answer_amount, on: :create
  validates :body, presence :true

  scope :correct, -> { where(correct :true) }

  private

  def validate_answer_amount
    errors.add(:answers_amount, "Answers limit reached") if question.answers.count > 4
  end
end
