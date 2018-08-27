class TeamsController < ApplicationController
      before_action :authenticate_user!

  def index
    @teams = Team.where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json { render json: TeamDatatable.new(view_context, user: current_user) }
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    begin
      if @team.save
        flash[:success] = 'Equipe cadastrada com sucesso!'
      end
    rescue => exception
      flash[:error] = 'Erro ao cadastrada equipe!'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
     @team = Team.find(params[:id])
    begin
      if @team.update_attributes(team_params)
        flash[:success] = 'Equipe atualizada com sucesso!'
      end
    rescue => exception
      flash[:error] = 'Erro ao atualizar equipe!'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    begin
      if @team.delete
        flash[:success] = 'Equipe deletada com sucesso!'
      end
    rescue => exception
      flash[:error] = 'Erro ao deletar equipe!'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
