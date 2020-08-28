class RepaymentRecordsController < ApplicationController
  before_action :find_repayment_record, only: [ :edit, :update,:destroy]

  def index
    @repayment_records = RepaymentRecord.order("payment_date desc")
  end

  def new
    @repayment_record = RepaymentRecord.new
  end

  def create
    @repayment_record = RepaymentRecord.new(permit_params)
     if @repayment_record.save
      CreditCardRecord.where(id: params[:credit_card_record_ids]).update_all(repayment_record_id: @repayment_record.id)
      redirect_to repayment_records_path, notice: "添加成功！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @repayment_record.update(permit_params)
      CreditCardRecord.where(id: @repayment_record.credit_card_records.map{|c| c.id.to_s} -params[:credit_card_record_ids]).update_all(repayment_record_id: nil)
      CreditCardRecord.where(id: params[:credit_card_record_ids]).update_all(repayment_record_id: @repayment_record.id)
      redirect_to repayment_records_path, notice: "修改成功！"
    else
      render 'edit'
    end
  end

  private
  def find_repayment_record
    @repayment_record = RepaymentRecord.find params[:id]
  end

  def permit_params
    params.require(:repayment_record).permit(:total_amount, :payment_date, :message)
  end
end