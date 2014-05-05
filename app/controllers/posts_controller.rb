class PostsController < ApplicationController
	include PostsHelper

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comment.post_id = @post.id
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save

		if @post.save
			if params[:attachments]
		        params[:attachments].each { |image|
		          @post.attachments.create(image: image)
		        }
		    else
		    	flash.notice = "Whoopsies"
	      	end
	      	flash.notice = "Post '#{@post.title}' Created!"
			redirect_to @post
		else
			flash.notice = "It didn't work!"
			redirect_to posts_path
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		flash.notice = "Post '#{@post.title}' Deleted!"

		redirect_to posts_path
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)

		flash.notice = "Post '#{@post.title}' Updated!"

		redirect_to post_path(@post)
	end

end
