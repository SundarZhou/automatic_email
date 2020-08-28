class AddMessageToRepaymentRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :repayment_records, :message, :string
  end
end
