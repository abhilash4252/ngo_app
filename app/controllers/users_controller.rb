class UsersController < ApplicationController
  def index
    @allevents = Event.all - Event.where(id: current_user.participations.collect { |p| p.event_id } )
    @participating = Event.where(id: current_user.participations.collect { |p| p.event_id } )
  end
end
