class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :current_works]
  
  def collection
    rental_book = Book.find(params[:book_id]).create_rental_book
    user = User.find(params[:id])
    if user.collection_books << rental_book
      render json: {status: true}
    else
      render json: {status: false}
    end
  end
  
  
  def join
    @user = User.new()
    @user.password = params[:password]
    @user.email = params[:email]
    @user.save
    render nothing: true
  end
  
  def show
  end

  def edit
  end

  def new
  end
  
  def current_works
    @works = @user.current_works
    # @works = self
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
