class UsersController < ApplicationController
  def index
    @allevents = Event.all
  end
end
