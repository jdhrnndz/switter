class SweetsController < ApplicationController
	def create
	    @swit = Swit.find(params[:swit_id])
	    @sweet = @swit.sweets.create(swit_params)
	    redirect_to swits_path(Swit.all)
  	end

  	def destroy
  		@sweet = Sweet.where("voter = ? and swit_id = ?", params[:id].to_s, params[:swit_id]).first
	    @sweet.destroy
	    respond_to do |format|
	      format.html { redirect_to swits_url }
	      format.json { head :no_content }
	    end
	  end

	private
	    def swit_params
	    	params.require(:sweet).permit(:voter)
	    end
end
