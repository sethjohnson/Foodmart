class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @title = @food.name
  end

  def create
    @text = params[:food][:name];

  @food = Food.find(
        :all, :conditions => ["UPPER(name) LIKE ?", "#{@text.upcase}%"]).sort!{
        |a,b| a.name.downcase <=> b.name.downcase
      }
      @food = Food.new(params[:food])
    if @food.save
      flash[:success] = "You made some food! Snack time!"
      redirect_to @food
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
