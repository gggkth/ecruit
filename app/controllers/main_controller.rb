class MainController < ApplicationController
    def home
        
    end
    
    def show
        
    end
    
    def recruit
        @posts = RecruitPost.all
    end
    
    def hr
        
    end
    
    def apply
        if current_user
            @posts = RecruitPost.where(name: current_user.name)
        end
    end
    
    def app_eval
        @post_id = params[:post_id]
        @applicants = RecruitPost.where(id: @post_id)[0].users
    end
    
    def create_apply
        @post = RecruitPost.where(id: params[:post_id])
        @post[0].users << current_user
        @post[0].save
        
        redirect_to '/recruit'
    end
end
