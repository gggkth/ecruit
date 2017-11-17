class PostsController < ApplicationController
    def new_recruit
       @post = RecruitPost.new
    end
    
    def create_recruit
       @post = RecruitPost.new
       @post.title = params[:recruit_post][:title]
       @post.content = params[:recruit_post][:content]
       @post.duedate = params[:recruit_post][:duedate]
       @post.save
       
       redirect_to '/recruit'
    end
end
