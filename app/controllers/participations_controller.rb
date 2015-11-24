class ParticipationsController < ApplicationController
  def create
    @participation = current_user.participations.new()
    @participation.event_id = params[:event_id]
    @participation.save
  end
end
