# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :name

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :password, confirmation: true

  has_secure_password

  def tests_by_level(levels)
    tests.where(level: levels)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
