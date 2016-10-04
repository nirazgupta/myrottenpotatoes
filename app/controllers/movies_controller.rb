class MoviesController < ApplicationController
  
 
  
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
  
  def index
    @movies = Movie.order('LOWER(title)').all
    
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  
  def new
    @movie=Movie.new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
 
  def update
  @movie = Movie.find(params[:id])
  @movie.update_attributes!(movie_params)
  flash[:notice] = "#{@movie.title} was successfully updated."
  redirect_to movies_path
  end

  
  def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  flash[:notice] = "movie '#{@movie.title}' was successfully deleted."
  redirect_to movies_path
  end
  
  def check_for_cancel
    if(params[:commit]=="cancel")
       flash[:notice] = "Registration is cancelled. "
    redirect_to movie_path
    end
  end
  
end



