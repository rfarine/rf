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

		flash.notice = "Post '#{@post.title}' Created!"

		redirect_to post_path(@post)
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

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect { |s| s.strip.downcase }.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end

end
