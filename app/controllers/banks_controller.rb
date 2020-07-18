class BanksController < ApplicationController
  before_action :find_bank, only: [ :edit, :update,:destroy]

  def index
    @banks = Bank.order("repayment_date asc")
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(permit_params)
     if @bank.save
      redirect_to banks_path, notice: "添加成功！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @bank.update(permit_params)
      redirect_to banks_path, notice: "修改成功！"
    else
      render 'edit'
    end
  end

  private
  def find_bank
    @bank = Bank.find params[:id]
  end

  def permit_params
    params.require(:bank).permit(:name, :repayment_date, :billing_date)
  end

end