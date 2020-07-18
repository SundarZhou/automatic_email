class RepaymentRecord < ApplicationRecord
  has_many :credit_card_records

  def message
    "#{payment_date}-#{total_amount}"
  end

  def self.pluck_for_select
    self.all.map{|r| [r.message, r.id]}
  end
end
