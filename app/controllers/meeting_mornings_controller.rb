class MeetingMorningsController < ApplicationController
    def index
        @meetings = MeetingMorning.where(member_id: params[:id])
        respond_to do |format|
        format.html
        format.json { render json: MeetingMorningDatatable.new(view_context, member: params[:id]) }
        end
    end

    def new
        @meeting = MeetingMorning.new
        @meetings = MeetingMorning.where(member_id: params[:id]).last
        if @meetings
            if @meetings.created_at.beginning_of_day == Time.zone.now.beginning_of_day
                redirect_to meeting_mornings_path(params[:id])
                flash[:success] = 'Você ja cadastrou a resposta de hoje!'
            end
        end
    end

    def create
        @member = Member.find(params[:id])
        @meeting = MeetingMorning.new(meeting_params)
        @meeting.member_id = @member.id

        begin
        if @meeting.save
            redirect_to meeting_mornings_path(params[:id])
            flash[:success] = 'Resposta cadastrado com sucesso!'
        end
        rescue => exception
            flash[:error] = 'Erro ao cadastrada resposta!'
        end
    end

    private

    def meeting_params
        params.require(:meeting_morning).permit(:message_one, :message_two)
    end
end
