class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #layout "user", only: [:show]

  # GET /users
  # GET /users.json
  # Login / Logout Demonstration (make sure view is changed as well)
  def index
    @users = User.all
    # render json: session
    # message = (session[:id] == 1 ? 'logged in' : 'logged out')
    # #render plain: message
  end

  def login
    session[:id] = 1
    redirect_to root_path, notice: "You have just logged in."
  end

  def logout
    session.delete :id
    redirect_to root_path, notice: "You have just logged out."
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #p "Hello World"
    #head 404
    #render xml: @user
    #render json: @user
    #render inline: '<%= Time.now %>'
    # if session[:id] != 1
    #   render plain: "You are not allowed to view this page"
    # end
    #render plain: "Kool"
    #render 'users/home'
    #render file: 'home.html'

    #try following with ?another_param=Hello or ?arr[]=1&arr[]=2
    #render json: params

    #session[:school] = 'wyncode'
    #render json: session
    #session.delete :school
  end

  # Sample test for a post
  def paul
    render json: params
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    #render json: params
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    p user_params
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:email,:code_school_id)
    end
end
# Login / Logout Demonstration (make sure view is changed as well)
# def index
#   render json: session
#   message = (session[:id] == 1 ? 'logged in' : 'logged out')
#   #render plain: message
# end
#
# def login
#   session[:id] = 1
##   flash[:notice] = "You have just logged in."
#   redirect_to root_path
# end
#
# def logout
#   session.delete :id
##   flash[:notice] = "You have just logged out."
#   redirect_to root_path
# end
