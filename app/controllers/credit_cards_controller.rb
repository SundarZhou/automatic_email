class CreditCardsController < ApplicationController
  before_action :find_credit_card, only: [ :edit, :update,:destroy, :outstanding]

  def index
    @credit_cards = CreditCard.joins(:bank).order("banks.name desc")
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = CreditCard.new(permit_params)
     if @credit_card.save
      redirect_to credit_cards_path, notice: "添加成功！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @credit_card.update(permit_params)
      redirect_to credit_cards_path, notice: "修改成功！"
    else
      render 'edit'
    end
  end

  def outstanding
    @records = @credit_card.credit_card_records.where(repayment_record_id: nil)
  end

  private
  def find_credit_card
    @credit_card = CreditCard.find params[:id]
  end

  def permit_params
    params.require(:credit_card).permit(:number, :bank_id)
  end

end