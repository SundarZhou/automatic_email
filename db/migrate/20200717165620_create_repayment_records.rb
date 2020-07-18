class CreateRepaymentRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :repayment_records do |t|
      t.float :total_amount
      t.date :payment_date

      t.timestamps
    end
  end
end
