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

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      redirect_to dogs_url, notice: "Successfully Updated #{@dog.name}"
    else
      flash.now[:notice] = "Something went wrong. We couldn't update #{@dog.name}"
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    if @dog.destroy
      redirect_to dogs_url, notice: "#{@dog.name} has been succesfully deleted."
    else
      redirect_to dogs_url, notice: "Couldn't delete #{@dog.name}"
    end
  end

  private
  # protection from SQL injection using strong params
  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :owner_id)
  end

end
