class TestController < ApplicationController
  before_action :set_test, only: %i[show start]
  before_action :set_user, only: %i [user]

  def new
  	@test = Test.new
  end

  def create
  	@test = Test.find(test_params)

  	if @test.save
  	  redirect_to :@test 
  	else
  	  render :new 
  	end
  end

  def start
  	@test = Test.find(params[:id])
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
