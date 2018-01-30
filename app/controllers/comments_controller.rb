class CommentsController < ApplicationController
before_action :find_video
before_action :find_comment, only: [:edit, :update, :destroy]
before_action :authenticate_user!

	def new
		@comment = Comment.new
	end

	def create
		@comment = @video.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to video_path(@video)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to video_path(@video)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to video_path(@video)
	end

	private
		def comment_params
			params.require(:comment).permit(:content)
		end

		def find_video
			@video = Video.find(params[:video_id])
		end

		def find_comment
			@comment = @video.comments.find(params[:id])
		end


end
