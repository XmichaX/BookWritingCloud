class VersionsController < ApplicationController

	before_filter :authenticate_user!

	def restore
		@version = Version.find(params[:id])
		if @version.reify
			@version.reify.save!
		else
			@version.item.destroy
		end
		redirect_to :back, :notice => "Undid #{@version.event}"
	end

	def diff
		@diff = Differ.diff("o mundo acabou", "o mundo acabou ontem")
	end

end