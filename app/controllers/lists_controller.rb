class ListsController < ApplicationController
	before_action :require_login, :only => :create

	def index
		@lists = List.all
		@list = current_user.lists.build

	end

	def new
		@list = current_user.lists.build

	end

	def create
		@list = current_user.lists.build(list_params)

		if	@list.save
			render :json => @list
		else
			render :json => { :errors => @list.errors.full_messages}, :status => 422
		end
	end

	def show
		@list = @user.lists.find(params[:id])
	end

	def edit
		@list.update
		redirect_to root_url
	end

	def destroy
		@list.destroy
		redirect_to root_url
	end

	private
	def list_params
		params.require(:list).permit(:name)
	end

end
