# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: %i[show start edit update destroy]

  def show; end

  def new
    @test = Test.new
  end

  def index
    @tests = Test.all
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def start
    @user = User.first

    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def destroy
    @test.destroy

    redirect_to test_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
