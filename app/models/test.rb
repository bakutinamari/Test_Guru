class Test < ApplicationRecord
  belongs_to :category

  def self.name_tests(title)
    where(categories: {title: title}).order(title: :desc)
  end
end
