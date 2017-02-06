class DogsController < ApplicationController
  def index
    # asking the Dog class in the model to return all of the dogs
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dogs_url, notice: "Successfully Saved"
    else
      flash.now[:notice] = "Something went wrong and we couldn't save your dog."
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end


  private
  # protection from SQL injection using strong params
  def dog_params
    params.require(:dog).permit(:name, :age, :breed)
  end

end
