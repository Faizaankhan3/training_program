class UsersController < ApplicationController
  def index
    @users = User.sorted
    @candidates = User.where(admin_user: false)
    render('index')
  end

  def show
    @candidate = User.find(params[:id])
  end

  def new
    @candidate = User.new
  end

  def create
    #Instantiate a new object using form parameters
    @candidate = User.new(user_params)
    # Save the object
    if @candidate.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "New Candidate Added Successfully"
      redirect_to(users_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @candidate = User.find(params[:id])
  end

  def update 
    #Find a new object using form parameters
    @candidate = User.find(params[:id])
    # Save the object
    if @candidate.update_attributes(user_params)
      # If save succeeds, redirect to the index action
      flash[:notice] = "Updation Successful."
      redirect_to(user_path(@candidate))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @candidate = User.find(params[:id])
  end

  def destroy
    @candidate = User.find(params[:id])
    @candidate.destroy
    redirect_to(users_path)
  end

  private
  
    def user_params
      #Whitelisting for strng parameters
      params.require(:user).permit(:name, :email, :password, :qualification, :college, :stream, :phone)
    end
end
