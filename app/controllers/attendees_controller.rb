class AttendeesController < ApplicationController
	def create
		puts params
		puts "I am in AttendeesController!"
		@attendee = Attendee.new(event_id: params["event_id"], user_id: session[:user_id])
		if @attendee.save
			redirect_to '/users/' + session[:user_id].to_s, notice: "attendee is created"
		else
			flash[:errors] = @attendee.errors.full_messages
			redirect_to '/users/' + session[:user_id].to_s, notice: "attendee is created"
		end
	end

	def destroy
		puts params
		puts "I am in attendee destroy!!!!\n\n\n"
		@attendee = Attendee.find_by(user_id: session[:user_id], event_id: params[:id])
		if @attendee.destroy
			redirect_to '/users/' + session[:user_id].to_s, notice: "attendee is destroy"
		else
			flash[:errors] = "Not able to destory attendee"
			redirect_to '/users/' + session[:user_id].to_s, notice: "attendee is destroy"
		end		
	end
end
