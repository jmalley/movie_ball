class StudiosController < ApplicationController
  def show
    @league = League.find(params[:id])
    @studio = Studio.find(params[:id])
    @movies = @studio.movies.all
  end
end
