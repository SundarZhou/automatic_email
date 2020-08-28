class RepaymentRecord < ApplicationRecord
  has_many :credit_card_records

  def select_message
    "(#{message})#{payment_date}-#{total_amount}"
  end

  def self.pluck_for_select
    [''] + self.all.map{|r| [r.select_message, r.id]}
  end
end
