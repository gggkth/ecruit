class PostsController < ApplicationController
    def new_recruit
       @post = RecruitPost.new
       @app = RecruitApplication.new
    end
    
    def create_recruit
       @post = RecruitPost.new
       @post.title = params[:recruit_post][:title]
       @post.content = params[:recruit_post][:content]
       @post.duedate = Time.zone.local(*params[:duedate].sort.map(&:last).map(&:to_i)) 
       @post.recruiter = current_user.id
       @post.save
       
       if current_user.user_type == "기업회원"
            @app = RecruitApplication.new
            @app.name = current_user.name
            @app.post_id = @post.id
            @app.save
            
            @questions = []
            @questions = params[:questions]
            @questions.each do |q|
                @qa = Qa.new
                @qa.question = q
                @qa.save
                @app.qas << @qa
                @app.save
            end
            
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
    
    def delete_recruit
        # @app = RecruitApplication.find_by(post_id: @post.id)
        @post = RecruitPost.find(params[:post_id])
        @post.destroy
        # @app.post_id == @post.id
        # @app.destroy
        redirect_to '/recruit'
    end
    
    def edit_recruit
       @post = RecruitPost.find(params[:post_id])
       @post.title = params[:recruit_post][:title]
       @post.content = params[:recruit_post][:content]
       @post.duedate = Time.zone.local(*params[:duedate].sort.map(&:last).map(&:to_i)) 
       @post.recruiter = current_user.id
       @post.save
       
       @app = RecruitApplication.find_by(post_id: @post.id)
            @app.name = current_user.name
            @app.post_id = @post.id
            @app.save
            
            @questions = Qa.where(recruit_application_id: @app.id)
            @edit_questions = params[:questions]
            @questions.each_with_index do |q, index|
                q.question = @edit_questions[index]
                q.save
            end
        redirect_to '/recruit'
    end
    
    def new_application
        @app = RecruitApplication.new
    end
    
    def create_application
        if current_user.user_type == "기업회원"
            @app = RecruitApplication.new
            @app.name = current_user.name
            @app.save
            
            @questions = []
            @questions = params[:question]
            @questions.each do |q|
                @qa = Qa.new
                @qa.question = q
                @qa.save
            end
            
            redirect_to '/recruit'
        else
            
           @app = RecruitApplication.new
           @post = RecruitPost.find(params[:recruit_application][:post_id])
           @app.title = params[:recruit_application][:title]
           @app.name = current_user.name
           @answers = []
           @questions = []
            @answers = params[:answers]
            @questions = params[:questions]
            @answers.each_with_index do |a, index|
                @qa = Qa.new
                @qa.answer = a
                @qa.question = @questions[index]
                @qa.save
                @app.qas << @qa
                @app.post_id = @post.id
                @app.save
            end
           @post.users << current_user
           @post.save
           @ai = ApplyInfo.find_by(user_id: current_user.id, recruit_post_id: @post.id)
           @ai.recruit_application_id = @app.id
           @ai.save
           
           
           redirect_to "/recruit"
        end
        
    end
    
    def new_apply
        @questions = Qa.where(recruit_application_id: RecruitApplication.find_by(post_id: params[:post_id]))
    #   @app_title = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].title
    #   @app_question = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].question
    #   @app_name = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].name
    
      @app = RecruitApplication.new
      @post = RecruitPost.find(params[:post_id])
    end
    
    def edit_apply
        @questions = Qa.where(recruit_application_id: RecruitApplication.find_by(post_id: params[:post_id]))
    #   @app_title = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].title
    #   @app_question = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].question
    #   @app_name = RecruitApplication.where(name: RecruitPost.where(id: params[:post_id])[0].name)[0].name
    
      @post = RecruitPost.find(params[:post_id])
      @app = RecruitApplication.find_by(post_id: @post.id)
      @qas = Qa.find_by(recruit_application: @app.id)
    end
    
end
