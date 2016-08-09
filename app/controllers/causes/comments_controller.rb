class Causes::CommentsController < CommentsController
  before_action :set_commentable
  
  private
    def set_commentable
      @commentable = Cause.find(params[:cause_id])
    end

end
