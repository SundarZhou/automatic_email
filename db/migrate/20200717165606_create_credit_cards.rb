class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.belongs_to :bank
      t.string :number, :unique => true

      t.timestamps
    end
  end
end
