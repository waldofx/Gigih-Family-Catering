class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]

  def index
    @foods = Food.all
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_path(@food), notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_path(@food), notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_path, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end
    
        # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :description, :price)
    end
end
