class UsersController < ApplicationController
  def index
    if user_signed_in?
      @participating = current_user.participating
      @myevents = current_user.created_events
      @allevents = Event.all - @participating - @myevents
    end
  end
end
