class QuestionsController < ApplicationController
    before_action: find_test, only: %i[new create]
    before_action:find_question, only: %i[destroy show]

	rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

	def new
    @question = @test.questions.new
  end

	def show;end

	def destroy
	  @question.destroy
    redirect_to_test_path(@question.test)
  end


  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new 
    end
  end

    private
    
    def rescue_with_question_not_found
    	render plain: 'Not found'
    end

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:body)
    end
end
