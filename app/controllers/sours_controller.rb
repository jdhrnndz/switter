class SoursController < ApplicationController
	def create
	    @swit = Swit.find(params[:swit_id])
	    @sour = @swit.sours.create(swit_params)
	    redirect_to swits_path(Swit.all)
	end
  	private
	    def swit_params
	    	params.require(:sour).permit(:voter)
	    end
end
