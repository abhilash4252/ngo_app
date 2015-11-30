class UsersController < ApplicationController
  def index
    if user_signed_in?
      @participating_events = current_user.participating_events
      @past_participating_events = @participating_events.where(":today > date", { today: Time.now.to_date })
      @upcoming_participating_events = @participating_events - @past_participating_events
      
      @created_events = current_user.created_events
      @finished_created_events = @created_events.where(":today > date ", { today: Time.now.to_date })
      @upcoming_created_events = @created_events - @finished_created_events
      
      @other_events = Event.all - @participating_events - @created_events
      @other_events = Event.where(id: @other_events.collect { |p| p.id })
      @finished_other_events = @other_events.where(":today > date", { today: Time.now.to_date })
      @upcoming_other_events = @other_events - @finished_other_events
    end
  end
end
