class CurrenciesController < ApplicationController
  before_action :find_currency, only: [ :edit, :update,:destroy]

  def index
    @currencies = Currency.all
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(permit_params)
     if @currency.save
      redirect_to currencies_path, notice: "添加成功！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @currency.update(permit_params)
      redirect_to currencies_path, notice: "修改成功！"
    else
      render 'edit'
    end
  end

  private
  def find_currency
    @currency = Currency.find params[:id]
  end

  def permit_params
    params.require(:currency).permit(:name)
  end

end