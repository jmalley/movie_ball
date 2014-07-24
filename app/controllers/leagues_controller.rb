class LeaguesController < ApplicationController
before_filter :authenticate_user!

  before_action :set_league, only: [:show, :edit, :update, :destroy]
  attr_accessor :league

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = current_user.leagues
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id])
    @invite = Invite.new

    # @invited = @league.invites.map{ |u| User.where("id = #{u.recipient_id}")}
    @invited = @league.invited_users.where("accepted is null")
    @memberships = @league.memberships.map{ |membership| membership.user }
    # @member_movies = @memberships.map{ |m| m.movies_for(@league)}
    #@member_users = User.where("id = #{@memberships.user_id}")

  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end

  def join
    @league = League.find(params[:l])
    if is_a_member?(@league.id)
      redirect_to @league, notice: 'You are already a member you silly goose!'
    else
      Membership.create!(
        :user_id => current_user.id,
        :league_id => params[:l]
        )
     
      Invite.accept_invite(@league.id, current_user.id)
      redirect_to @league, notice: 'You are now a member! Create your studio.' 
    end
  end

  # def create_studio
  #     @league = League.find(params[:id])
  #     Studio.create!(
  #       :league_id => @league.id
  #       )
  #     redirect_to @studio, notice: 'You now have a studio!'
  # end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)
    @league.owner_id = current_user.id

    respond_to do |format|
      if @league.save
        Membership.create!(
            :user_id => current_user.id,
            :league_id => @league.id
          )
        #current_user.populate_categories()
        # movies.populate_categories
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to leagues_url, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_params
      params.require(:league).permit(:name, :game_type, :logo)
    end
end
