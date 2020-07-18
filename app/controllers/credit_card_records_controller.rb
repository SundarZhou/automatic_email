class CreditCardRecordsController < ApplicationController
  before_action :find_credit_card_record, only: [ :edit, :update,:destroy]

  def index
    @credit_card_records = CreditCardRecord.all
  end

  def new
    @credit_card_record = CreditCardRecord.new
  end

  def create
    @credit_card_record = CreditCardRecord.new(permit_params)
     if @credit_card_record.save
      redirect_to credit_card_records_path, notice: "添加成功！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @credit_card_record.update(permit_params)
      redirect_to credit_card_records_path, notice: "修改成功！"
    else
      render 'edit'
    end
  end

  private
  def find_credit_card_record
    @credit_card_record = CreditCardRecord.find params[:id]
  end

  def permit_params
    params.require(:credit_card_record).permit(:currency_id, :credit_card_id, :amount, :credit_date, :repayment_record_id)
  end
end