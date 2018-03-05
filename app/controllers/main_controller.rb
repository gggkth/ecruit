class MainController < ApplicationController
    def home
        
    end
    
    def show
        @post = RecruitPost.find(params[:post_id])
        @app = RecruitApplication.find_by(post_id: @post.id)
    end
    
    def search
        @result = User.find_by(name: params[:query], user_type: "기업회원")
        if @result
            @posts = RecruitPost.where(recruiter: @result.id)
        end
    end
    def recruit
        @posts = RecruitPost.all
    end
    
    def hr
        
    end
    
    def apply
        if current_user
            @posts = RecruitPost.where(recruiter: current_user.id)
        end
    end
    
    def app_eval
        @post_id = params[:post_id]
        @applicants = RecruitPost.find(@post_id).users
    end
    
    def int_eval
        @post_id = params[:post_id]
        @applicants = RecruitPost.find(@post_id).users
    end
    
    def app_eval_application
        @applicant = User.find(params[:applicant_id])
        @app = RecruitApplication.find_by(name: @applicant.name)
        @app_info = ApplyInfo.find_by(recruit_application: @app.id)
        @app_num = @app.id
    end
    
    def create_app_eval
        app_info = ApplyInfo.find(params[:apply_info][:app_info_id])
        app_info.application_eval_score = params[:apply_info][:application_eval_score]
        app_info.apply_result = params[:pass]
        app_info.save
        redirect_to "/app_eval/#{RecruitPost.find_by(recruiter: current_user.id).id}"
    end
    
    def int_eval_application
        @app_num = params[:app_num]
        @app = RecruitApplication.find(@app_num)
        @app_info =  ApplyInfo.find_by(recruit_application: @app_num)
        @applicant = User.find(@app_info.user_id)
        @post_id = @app_info.recruit_post_id
    end
    def create_int_eval
        app_info = ApplyInfo.find(params[:apply_info][:app_info_id])
        app_info.interview_eval_score = params[:apply_info][:interview_eval_score]
        app_info.apply_result = params[:pass]
        app_info.save
        redirect_to "/int_eval/#{RecruitPost.find_by(recruiter: current_user.id).id}"
    end
end
