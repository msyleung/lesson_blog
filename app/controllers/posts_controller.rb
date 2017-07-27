class PostsController < ApplicationController
	before_action :find, only [:edit, :update, :show, :delete]

def index
	@posts = Post.all
end

def new
	@post = Post.new
end

def create
	@post = Post.new
	if @post.save(post_params)
		flash[:notice] = "Successfully created post!"
		redirect_to post_path(@post)
	else
		flash[:alert] = "Error creating new post!"
		render :new
	end
end

def show
end

def update
	if @post.update_attributes(post_params)
		flash[:notice] = "Successfully updated!"
		redirect_to post_path(@posts)
	else
		flash[:alert] = "Error"
		render :edit
	end
end

def edit
end

def destroy
end

def find
	@post = Post.find(params[:id])
end

def post_params
	params.require(:post).permit(:name, :desc)
end

end
