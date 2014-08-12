class StudiosController < ApplicationController

  before_filter :load_league

  def show
    @studio = Studio.find_league_studio(@league.id, params[:id])
    @studio_id = @studio.first.id
    # @studio_members = @studio.studio_ownerships.map{ |ownership| studio_ownership.user }
    @st = Studio.find(params[:id])
    @movies = @st.movies
  end

  def new
    @studio = @league.studios.new
    @studio.league_id = @league.id
  end

  def create
    @studio = @league.studios.new(studio_params)
    respond_to do |format|
      if @studio.save
        StudioOwnership.create!(
          :user_id => current_user.id,
          :studio_id => @studio.id,
          :league_id => @league.id
          )
          if @studio.movies.empty?
            @studio.movies.create!(:user_id => current_user.id, :category => 'Critical Darling')
            @studio.movies.create!(:user_id => current_user.id, :category => 'UltraSnub')
            @studio.movies.create!(:user_id => current_user.id, :category => 'Actors Access')
            @studio.movies.create!(:user_id => current_user.id, :category => 'Doc/Foreign/Animation')
            @studio.movies.create!(:user_id => current_user.id, :category => 'Early Release')
          else
            # todo: check selected movie status
          end
        # movies.populate_categories
        # binding.pry
        format.html { redirect_to [@league, @studio], notice: 'Studio was successfully created.' }
        format.json { render :show, status: :created, location: @studio }
      else
        format.html { render :new }
        format.json { render json: @studio.errors, status: :unprocessable_entity }
      end
    end
  end

  def populate_categories

  end

  private

  def load_league
    @league = League.find(params[:league_id])
  end

  def studio_params
    params.require(:studio).permit(:name, :logo)
  end

end
