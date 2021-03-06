class MoviesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
      @movies = studio.movies.search(params[:q]) || studio.movies
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @movie.user_id = current_user
    @movie.league_id = params[:league_id]
    @movie.studio_id = params[:studio_id]

  end

  def my_roster

  end

  # GET /movies/1/edit
  def edit
    @movie_id = Movie.find(params[:id])

    @movie.user_id = current_user.id
    @movie.league_id = params[:league_id]
    @movie.studio_id = params[:studio_id]
    @league = params[:league_id]

    @rotten_api_key = ENV['ROTTEN_TOMATOES_API']
    @string = params[:qauto]
    url = URI.encode("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{@rotten_api_key}&q=#{@string}&page_limit=5")
    res = JSON.load(RestClient.get(url))
    @rotten_response = res["movies"]
  end

  def rotten_search

  end

  # POST /movies
  # POST /movies.json
  def create
    # Movies have to be added to existing categories via movies#edit
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @studio, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    # Possible the below are not needed since they are already created
    #@movie.user_id = current_user
    #@movie.league_id = params[:league_id]
    @movie.rotten_id = params[:rotten_id]
    @movie.title = params[:title]

    @league = League.find params[:league_id]
    @studio = Studio.find params[:studio_id]

    @movie.league_id = @league.id

    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to league_studio_path(@league, @studio), notice: 'Your roster was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:movie_id] || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :rotten_id, :critics_score, :audience_score, :category, :user_id) #if params[:movie]
    end
end
