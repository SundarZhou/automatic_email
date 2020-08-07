class CreditCard < ApplicationRecord
  belongs_to :bank
  has_many :credit_card_records
  delegate :name, :repayment_date, :billing_date, :to => :bank, :allow_nil => true, :prefix => true

  def sort_number
    number[-4..-1]
  end

  def self.pluck_for_select
    self.all.map{|c| ["#{c.bank_name}-#{c.sort_number}", c.id]}.sort_by{|name, id| name}
  end
end
