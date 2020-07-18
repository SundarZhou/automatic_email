class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :name, null: false, :unique => true
      t.integer :repayment_date
      t.integer :billing_date

      t.timestamps
    end
  end
end
