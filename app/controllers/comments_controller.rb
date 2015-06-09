class CommentsController < ApplicationController
	def create
		puts "I am in comment create method!"
		@comment = Comment.new(content: params["content"], user_id: session[:user_id],
								 event_id: params[:event_id])
		if @comment.save
			redirect_to "/events/" + params["event_id"], notice: "Comments created!"
		else
			flash[:errors] = "Not able to create comment!"
			redirect_to "/events/" + params["event_id"], notice: "Comments created!"
		end
	end
end
