class SweetsController < ApplicationController
	def create
	    @swit = Swit.find(params[:swit_id])
	    @sweet = @swit.sweets.create(swit_params)
	    redirect_to swits_path(Swit.all)
  	end
	private
	    def swit_params
	    	params.require(:sweet).permit(:voter)
	    end
end
