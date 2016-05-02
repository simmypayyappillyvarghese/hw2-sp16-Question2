ASSIGNMENT2-QUESTION2

Refer: 
 Github Link : https://github.com/simmypayyappillyvarghese/hw2-sp16-Question2
STEPS TO SOLVE THE PROBLEM:
1) In order to view the dogs created in database by navigating /dogs and so on, we need to have views for the dog and need to create a controller Dogs with action new create index show using the following command
rails generate controller Dogs index show create new 
This will automatically update the routes.rb with route to dogs/index,dogs/show and so on.
2) Now create a Dog model
 Run the command to create model Dog with attributes name and age
rails generate model Dog name: string age: integer
Above command creates Dog data model and migration file in db.
2.a) Run the migration using rake command which will update the database
bundle exec rake db:migrate
2.b) Create the Dog model Objects, by starting the console in sandbox 
Dog model objects can be create either from console or once the view is implemented using the view we can create the object.
 Using the command :rails console—sandbox 
  EX: dog=Dog.new(“name:”Pluto”,age:”5”).
Either use new or create(will combine new and save operations)
This create a dog object with name Pluto and age 5
2.c) Save the Dog object to the database using <object_name.save>
EX:dog.save
2.d) Verify the created objects using find
Ex: Dog.find(1)-return the first entry in database

3) Validate the dog has name and age.
To validate the presence of name and age attributes add the following code into dog.rb file
validates :name,presence:true
validates :age,presence:true
And so if any dog entry is created without name or age. And when you run .valid? method on the object.It should return false else true.
Ex: dog3=Dog.new(name:””,age:4)
dog3.valid? >>false
dog3=Dog.create(name:”hello”)
dog3.valid >>false
dog4=Dog.new (name:“Pluto”,age:5)
dog4.valid?? true
3.a)To view the error run the command :<object_name>.errors.full_message
  Ex: dog3.errors.full_messages
  [“Age cannot be blank”]
3.b)Saving the invalid object to database using object_name.save  will return false indicating it’s not possible to save the invalid object to database
EX: dog3.save
>>false
3.c)Once the basic Dog model is compete create the dog object entries in database to display its information through URI
Run command >>rails console
Create entries using dog=Dog.create(name:”Aldro”,age:7)
4) To view these entries, following changes should be done
a) In routes.rb , modify the routes as follows:
get '/dogs',to:"dogs#index"                      #This will set the URL/dogs to index page
 get 'dogs/new',to:"dogs#new"               #This will create new_dog_path pointing to the new page
  get 'dogs/:id',to:"dogs#show",as: :dog   #This will set the URL/dogs/id to show page 
  post 'dogs',to:"dogs#create"          #This will receive a post request and set /dogs to /dogs/create
b) Define the methods in dog_controller.rb as follows:
def index
@dogs=Dog.all                                                    #This will fetch all the entries in the database  end

  def show
 @dog=Dog.find(params[:id])     
  end                                       #This will look for the entry in dogs tablewith id passed as params
  def new
    @dog=Dog.new                          #This will create a dog object with attributes as nil
  end
  def create                                                         #This will create a dog object with teh attributes passed to params
    @dog=Dog.create(dog_param)
    if @dog.save                                                     #If the save is successful will redirect to show page to display the created dog object
      redirect_to @dog
    else                                                             #If save is not successful ,will redirect to new page
      render 'new'
    end  
  end
  
  #This will create and return a hash with :name and :age as keys and                #values are respective values entered in the form
def dog_param                 
  params.require(:dog).permit(:name, :age)
  end  

c)Now Modify the views as follows , to display the content 
Index Page:
<!--This index page will display all the dog objects created and displays its name and age.Also on click on create new,will be navigated tonew.html page-->
<h1>All the Dogs in Database</h1>
<p><% @dogs.each do |d|%>
Dog Name: <%=d.name%> ,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Age: <%=d.age%>
<br/>
<%end%>
</p>
<p><%=link_to "Create New Dog" ,dogs_new_url %></p>
New Page
<!--This page creates a form with textfield which is appropriate for setting the name and age of the Dog object-->
<h1>New Dog</h1>
<p><%=form_for (@dog) do |d|%>
Dog Name:&nbsp <%=d.text_field :name%>    
Age:&nbsp<%=d.text_field :age%><br/><br/>
<%=d.submit "Create Dog"%> 
<%end%>    
</p>
Show Page
<!--This page displays the name and age attributes of the dog object based on the id passed to the params-->
<p>Dog Name: <%=@dog.name%></p>
<p>Age: <%=@dog.age%></p>

Finally add all the files to git and  run it in server :
https://assignment2-2-86448-simmyvarghese5.c9users.io/dogs –This will display all the entries created in database
https://assignment2-2-86448-simmyvarghese5.c9users.io/dogs/1-Display the first entry created in database
https://assignment2-2-86448-simmyvarghese5.c9users.io/dogs/new-Navigate to new page,displays the form to create new dog

NAME:SIMMY PAYYAPPILLY VARGHESE
ID:86448


