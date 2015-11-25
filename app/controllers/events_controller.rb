class EventsController < ApplicationController
  before_action :current_organisation
  def index
    @events = @current_organisation.events
  end

  def new
    @event = @current_organisation.events.new
  end

  def show
    @event = Event.find(params[:id])
    @participants = Participation.where(event_id: @event.id)
    @participants = User.where(id: @participants.collect { |u| u.user_id })
    if @event.organisation_id != @current_organisation.id
      redirect_to user_organisations_events_url
    end
  end

  def create
    @event = current_organisation.events.new(event_params)
    if @event.save
      flash[:notice] = "Event created succesfully"
      redirect_to user_organisation_event_path(current_user, @current_organisation, @event)
    else
      flash[:alert] = "Event creation failed"
      render :new
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to user_organisation_events_path(current_user, @current_organisation)
  end
  private
    def event_params
      params.require(:event).permit(:name,:date,:location)
    end
    def current_organisation
      @current_organisation = Organisation.find(params[:organisation_id])
    end
end
