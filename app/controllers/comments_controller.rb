class CommentsController < ApplicationController
	def create
		@swit = Swits.find(params[:swit_id])
		@comment = @swit.comments.create(comment_params)
		redirect_to swit_path(@swit)
  	end
 
  	private
    	def comment_params
      		params.require(:comment).permit(:commenter, :body)
    	end
end
