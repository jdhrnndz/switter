class DoortagsController < ApplicationController
	def create
	    @swit = Swit.find(params[:swit_id])
	    @doortag = @swit.doortags.create(doortag_params)
	    redirect_to swits_path(Swit.all)
	end
  	private
	    def doortag_params
	    	params.require(:doortag).permit(:doortag)
	    end
end
