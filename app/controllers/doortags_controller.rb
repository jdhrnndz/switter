class DoortagsController < ApplicationController
	def create
	    @swit = Swit.find(params[:swit_id])
	    @doortag = @swit.doortags.create(doortag_params)
	    redirect_to swits_path(Swit.all)
	end
	def get_related
		sql = "Select * from swits where text like \'\%\{" + params[:tag] + "\}\%\' order by created_at desc;"

		@swits = Swit.find_by_sql(sql)

    	@recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")

		render action: 'index'
	end
  	private
	    def doortag_params
	    	params.require(:doortag).permit(:doortag)
	    end
end
