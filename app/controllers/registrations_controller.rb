class RegistrationsController < ApplicationController
  # POST /registration or /registration.json
  def create
    @user = User.find(registration_params[:user_id])
    @event = Event.find(registration_params[:event_id])

    @registration = Registration.new(user: @user, event: @event)
    respond_to do |format|
      if @registration.save
        format.html { redirect_to event_url(@event), notice: "You have successfully registered for #{@event.title}" }
        format.json { render :show, status: :created, location: @event }
      else
          format.html { redirect_to events_path, alert: "Something went wrong" }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end

  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to events_path, alert: "Invalid email or event" }
      format.json { render json: @registration.errors, status: :unprocessable_entity }
    end
  end

  private
  def registration_params
    params.require(:registration).permit(:user_id, :event_id)
  end
end