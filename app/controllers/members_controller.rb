class MembersController < ApplicationController
    before_action :authenticate_user!

  def index
    @members = Member.where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json { render json: MemberDatatable.new(view_context, user: current_user) }
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.user_id = current_user.id
    begin
      if @member.save
        flash[:success] = 'Membro cadastrada com sucesso!'
      end
    rescue => exception
      flash[:error] = 'Erro ao cadastrada membro!'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
     @member = Member.find(params[:id])
    begin
      if @member.update_attributes(member_params)
        flash[:success] = 'Membro atualizada com sucesso!'
      end
    rescue => exception
      flash[:error] = 'Erro ao atualizar membro!'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.meeting_mornings.delete_all
    @member.meeting_afternoons.delete_all
    begin
      if @member.delete
        flash[:success] = 'Membro deletada com sucesso!'
      end
    rescue => exception
      flash[:error] = 'Erro ao deletar membro!'
    end
  end

  private

  def member_params
    params.require(:member).permit(:email, :team_id)
  end
end
