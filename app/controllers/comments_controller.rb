class CommentsController < ApplicationController
	def create
		@swit = Swit.find(params[:swit_id])
		@comment = @swit.comments.create(comment_params)
		redirect_to swits_path(Swit.all)
  	end

  	def destroy
  		@comment = Comment.find(params[:id])
    	@comment.destroy
      	@name = User.find_by_id(session[:user_id]).username
	    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
	    respond_to do |format|
      		format.html { redirect_to swits_url }
      		format.json { head :no_content }
    	end
  	end

  	def show
	    @name = User.find_by_id(session[:user_id]).username
	    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
	end

	def edit
		@name = User.find_by_id(session[:user_id]).username
		@recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
		@comment = Comment.find(params[:id])
	end

	def update
	    respond_to do |format|
	      if @comment.update(comment_params)
	        format.html { redirect_to @comment, notice: 'Swit was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	 	end
	 end

  	private
  		def set_swit
	      @comment = Comment.find(params[:id])
	    end

    	def comment_params
      		params.require(:comment).permit(:commenter, :comment)
    	end
end
