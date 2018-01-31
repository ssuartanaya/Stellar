class RepliesController < ApplicationController
	before_action :find_reply, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def create
		@reply = Reply.new(reply_params)
		@reply.user_id = current_user.id

		if @reply.save
			redirect_to video_path(@reply.video_id)
		end
	end

	def edit
	end

	def update
		if @reply.update(reply_params)
			redirect_to video_path(@video)
		else
			render 'edit'
		end
	end

	def destroy
		@reply.destroy
		redirect_to video_path(@video)
	end

	private
		def reply_params
			params.require(:reply).permit(:content, :comment_id, :video_id)
		end

		def find_reply
			@reply = @comment.replys.find(params[:id])
		end

end
