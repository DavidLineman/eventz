class RegistrationsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @registrations = @event.registrations
  end

  def new
    @event = Event.find(params[:event_id])
    @registration = @event.registrations.new
  end

  def create
    @event = Event.find(params[:event_id])
    @registration = @event.registration.new(params[:registration])

    if @registration.save
      redirect_to event_registrations_url(@event), 
        notice: "Thanks for registering!"
    else  
      render :new
    end
  end

end
