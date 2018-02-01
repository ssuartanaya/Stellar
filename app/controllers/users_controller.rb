class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end
	def show_follow
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def notif
		@user = User.find(params[:id])
	end	

	def update
		@user = User.find(params[:id])
		if(@user.update(user_params))
			flash[:notice] = "Successfully update profile"
			bypass_sign_in @user, scope: :user
		  redirect_to @user
		else 
		  render 'edit'
		end  
	end

	def follow
		@user = User.find(params[:id])
		@follow = @user.follows.new
		@follow.user_id = current_user.id
		@follow.status = 0
		@follow.save
		redirect_to @user
	end

	def accept
		# s
		# @user = User.find(params[:id])
		@follow = Follow.where("user_id = ? and following = ?", params[:following_id], params[:id]).first
		# @follow.user_id = current_user.id
		@follow.status = 1
		@follow.save
		redirect_to notif_user_path(current_user)
	end

	def decline
		@follow = Follow.where("user_id = ? and following = ?", params[:following_id], params[:id]).first
		# @follow.user_id = current_user.id
		@follow.destroy
		redirect_to notif_user_path(current_user)
	end

	def unfollow
		# @user = User.find(params[:id])
		@unfol = Follow.where("following = ? and user_id = ?", params[:id], current_user.id).first
		# puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< #{@unfol.inspect} "
		# @unfol = @user.follows.find()
		@unfol.destroy
		redirect_to user_path(@unfol.following)
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :foto, :password, :bio)
	end
	

end
