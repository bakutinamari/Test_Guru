class TestsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(params[:test])

    if test.save
      redirect_to :@tests
    else 
      render :new
    end
  end
end
