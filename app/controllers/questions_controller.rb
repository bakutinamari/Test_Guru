class QuestionsController < ApplicationController
    before_action: find_test

	rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

	def index
      @questions = Question.all 
	end

	def show
      @question = Question.find(params[:id]) 
    end

	def destroy
	  @question = Question.find(params[:id])
	  @question.destroy
    end


    def create
      Question.create(
      	body: params[:question][:body]
      	test_id: params[:question][:test_id])
    end

    private
    
    def rescue_with_question_not_found
    	render plain: 'Not found'
    end

    def find_test
      @test = Test.find(params[:id])
    end

end
