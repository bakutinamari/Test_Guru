class TestsController < ApplicationController
  def index
  	@test = Test.all
  end
end
