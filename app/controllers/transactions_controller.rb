require 'pry'

class TransactionsController < ApplicationController
  # before_action :require_login, :only => :create
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]


	def index
		@transactions = List.all
		# @Transaction = current_user.transactions.build

	end

	def new
		@transaction = current_user.transactions.build

	end


  def create
    logger.debug "test" + session[:_csrf_token]

    @transaction = Transaction.new(transaction_params)
    # todo_params = it is a method = represents data submitted
    if @transaction.save
      respond_to do |format|
        format.html { redirect_to @transaction, :notice => "Transaction created!" }
        format.json { render :json => @transaction }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render :status => 400, :json => nil }
      end
    end
  end


	# def create
	# 	@transaction = current_user.transactions.build(transaction_params)
  #
	# 	if	@transaction.save
	# 		render :json => @transaction
	# 	else
	# 		render :json => { :errors => @transaction.errors.full_messages}, :status => 422
	# 	end
	# end


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
		params.require(:transaction).permit(:item, :amount, :list_id)
	end

end
