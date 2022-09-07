# frozen_string_literal: true

class AddBodyOnAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :body, :text
  end
end
