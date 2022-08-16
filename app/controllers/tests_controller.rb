class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start

  def show;end
  
  def index 
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to :@test
    else
      render :new
    end
  end

  def start
    
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def destroy
    @test.destroy!

    redirect_to test_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end

     