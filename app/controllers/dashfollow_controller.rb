class DashfollowController < ApplicationController
    def liat
        @videos = Video.all
    end
end
