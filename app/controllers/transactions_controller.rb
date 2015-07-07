class TransactionsController < ApplicationController
  before_action :require_login, :only => :create

	def index
		@transactions = List.all
		# @Transaction = current_user.transactions.build

	end

	def new
		@transaction = current_user.transactions.build

	end


	def create
		@transaction = current_user.transactions.build(transaction_params)

		if	@transaction.save
			render :json => @transaction
		else
			render :json => { :errors => @transaction.errors.full_messages}, :status => 422
		end
	end


	def show
		@transaction = @user.transactions.find(params[:id])
	end

	def edit
		@transaction.update
		redirect_to root_url
	end

	def destroy
		@transaction.destroy
		redirect_to root_url
	end

	private

  def set_transaction
		@transaction = Transaction.find(params[:id])
	end

	def transaction_params
		params.require(:transaction).permit(:item, :amount)
	end

end
