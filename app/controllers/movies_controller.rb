# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
def record_not_found(exception)
  #render json: {error: exception.message}.to_json, status: 404
   redirect_to movies_path(1)
    return
end

  
def index
    @movies = Movie.all
end


  
def cancel
    @movies = Movie.all
end
  
  
def create
    params.require(:movie)
    my_movie = params[:movie].permit(:title,:rating,:release_date)
    # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
    # rest of code...
    @movie = Movie.create!(my_movie)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
    
end


def set_movie
params[:movie].permit(:title,:rating,:release_date)
end


# in app/controllers/movies_controller.rb
def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
end

def new
  @movie = Movie.new
  # default: render 'new' template
end 


def edit
  @movie = Movie.find params[:id]
end

def update
  @movie = Movie.find params[:id]
  @movie.update_attributes!(set_movie)
  flash[:notice] = "#{@movie.title} was successfully updated."
  redirect_to movie_path
end



end