class ParticipationsController < ApplicationController
  def create
    @participation = current_user.participations.new()
    @participation.event_id = params[:event_id]
    if(Event.find(@participation.event_id).date >= Time.now.to_date )
      @participation.save
    end
    redirect_to root_path
  end
  def index
    @participating_events = current_user.participating_events
    @past_participating_events = @participating_events.where(":today > date", { today: Time.now.to_date })
    @upcoming_participating_events = @participating_events - @past_participating_events
  end
  def show
    @event = Event.find(params[:id])
    @participating = current_user.participating_events
  end
  def destroy
    Participation.where(event_id: params[:id],user_id: current_user.id).first.destroy
    redirect_to participations_path
  end
end
