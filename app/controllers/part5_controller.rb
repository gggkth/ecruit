class Part5Controller < ApplicationController
    def applying
        if current_user
            @infos = ApplyInfo.where(user: current_user.id)
        end
    end
end