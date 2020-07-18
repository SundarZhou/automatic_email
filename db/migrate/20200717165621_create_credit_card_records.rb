class CreateCreditCardRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_card_records do |t|
      t.belongs_to :credit_card
      t.belongs_to :repayment_record
      t.belongs_to :currency
      t.float :amount
      t.date :credit_date

      t.timestamps
    end
  end
end
