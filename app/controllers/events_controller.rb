class EventsController < ApplicationController
	def create
		puts "events create method!"
		puts params;
		@event = Event.new(name: params["name"], edate: params["edate"], 
							city: params["city"], state: params["state"], user_id:session[:user_id] )
		if @event.save
			redirect_to '/users/' + session[:user_id].to_s, notice: "event is created"
		else
			flash[:errors] = @event.errors.full_messages
			redirect_to '/users/' + session[:user_id].to_s
		end
	end

	def show
		@event = Event.find(params[:id])
		#render "/events"
	end

	def destroy
		@event = Event.find(params[:id])
		if @event.destroy
			redirect_to '/users/' + session[:user_id].to_s, notice: "event is deleted!"
		else
			flash[:errors] = "Failed to delete event!"
			redirect_to '/users/' + session[:user_id].to_s
		end
	end
end
