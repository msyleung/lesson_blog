class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def show
		find_post
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	def edit
		find_post
	end

	def destroy
		find_post
		@post.destroy
		redirect_to posts_path
	end

	private

		def find_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:name, :body)
		end

end
