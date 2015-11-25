class UsersController < ApplicationController
  def index
    if user_signed_in?
      @allevents = Event.all - Event.where(id: current_user.participations.collect { |p| p.event_id } )
      @participating = Event.where(id: current_user.participations.collect { |p| p.event_id } )
      @myevents = Event.where(organisation_id: current_user.organisations.ids) 
    end
  end
end
