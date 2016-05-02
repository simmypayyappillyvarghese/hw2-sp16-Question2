class DogsController < ApplicationController
  def index
    @dogs=Dog.all                                                    #This will fetch all the entries in the database
  end

  def show
    @dog=Dog.find(params[:id])                                      #This will look for the entry in dogs tablewith id passed as the params
  end

  def new
    @dog=Dog.new                                                     #This will create a dog object with attributes as nil
  end
  
  def create                                                         #This will create a dog object with teh attributes passed to params
    @dog=Dog.create(dog_param)
    if @dog.save                                                     #If the save is successful will redirect to show page to display the created dog object
      redirect_to @dog
    else                                                             #If save is not successful ,will redirect to new page
      render 'new'
    end  
  end
  
  def dog_param                                                      #This will create and return a hash with :name and :age as keys and values are respective values entered in the form
     params.require(:dog).permit(:name, :age)
  end  

end
