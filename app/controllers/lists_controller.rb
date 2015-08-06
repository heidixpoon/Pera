class ListsController < ApplicationController
	# before_action :require_login :only => :index, :create, :show, :edit, :destroy
	before_action :set_list, only: [:show, :edit, :update, :destroy]



	def index
		@lists = current_user.lists.all
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
		@transactions = @list.transactions

		logger.debug "test" + session[:_csrf_token]
		# @transactions = Transaction.where({:list_id => @list.id })

		# @lists = List.all
		# @transactions = Transaction.all
		# @transactions = @user.transactions.find(params[:id])
		# @transactions = Transaction.find(params[:id])



		# @transactions = current_user.transactions.where("list_id=?", params[:id])

		# render :json => @list
	end

	def update
		respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@list.destroy
		respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
		end

		# @transaction.destroy
		# respond_to do |format|
		# 	format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
		# 	format.json { head :no_content }
		# end

		# redirect_to root_url
	end

	private

	def set_list
		@list = List.find(params[:id])
	end

	def list_params
		params.require(:list).permit(:name)
	end

end
