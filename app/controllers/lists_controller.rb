class ListsController < ApplicationController

	def index

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
		@list = @user.drinks.find(params[:id])
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
	def drink_params
		params.require(:drink).permit(:name)
	end
end
