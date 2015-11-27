class ParticipationsController < ApplicationController
  def create
    @participation = current_user.participations.new()
    @participation.event_id = params[:event_id]
    @participation.save
    redirect_to root_path
  end
  def index
    @participating = current_user.participating
  end
  def show
    @event = Event.find(params[:id])
    @participating = current_user.participating
  end
  def destroy
    Participation.where(event_id: params[:id],user_id: current_user.id).first.destroy
    redirect_to participations_path
  end
end
