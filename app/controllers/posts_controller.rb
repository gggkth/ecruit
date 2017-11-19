class PostsController < ApplicationController
    def new_recruit
       @post = RecruitPost.new
    end
    
    def create_recruit
       @post = RecruitPost.new
       @post.title = params[:recruit_post][:title]
       @post.content = params[:recruit_post][:content]
       @post.duedate = Time.zone.local(*params[:duedate].sort.map(&:last).map(&:to_i)) 
       @post.name = current_user.name
       @post.save
       
       redirect_to '/recruit'
    end
    
    def new_application
        @app = RecruitApplication.new
    end
    
    def create_application
        if current_user.user_type == "기업회원"
            @app = RecruitApplication.new
            @app.title = params[:recruit_application][:title]
            @app.name = current_user.name
            @app.question = params[:recruit_application][:question]
            @app.save
            
            redirect_to '/recruit'
        else
           @app = RecruitApplication.new
           @app.title = params[:recruit_application][:title]
           @app.name = params[:recruit_application][:name]
           @app.question = params[:recruit_application][:question]
           @app.answer = params[:recruit_application][:answer]
           @app.save
           
           redirect_to "/create_apply/#{RecruitPost.where(name: @app.name)[0].id}"
        end
        
    end
    
    def new_apply
       @app_title = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].title
       @app_question = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].question
       @app_name = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].name
       @app = RecruitApplication.new
    end
end
