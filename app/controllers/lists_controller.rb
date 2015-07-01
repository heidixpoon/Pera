class ListsController < ApplicationController
	# before_action :require_login :only => :create, :show, :edit, :destroy
	before_action :set_list, only: [:show, :edit, :update, :destroy]


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
		@list = current_user.lists.find(params[:id])
		@lists = List.all

		# @transactions = current_user.transactions.where("list_id=?", params[:id])

		# render :json => @list
	end

	def edit
		@list.update
		redirect_to root_url
	end

	def destroy
		@list.destroy
		respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
		end
		# redirect_to root_url
	end

	private

	def set_list
		@list = List.find(params[:id])
	end

	# strong params
	def list_params
		params.require(:list).permit(:name)
	end

end
