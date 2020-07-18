class CreditCardRecord < ApplicationRecord
  belongs_to :credit_card
  belongs_to :currency
  belongs_to :repayment_record

  delegate :name, :to => :currency, :allow_nil => true, :prefix => true

  def message
    "#{credit_card.bank_name}-#{credit_card.sort_number}-#{amount}"
  end

  def self.pluck_for_select
    all.map{|c| [c.message, c.id]}
  end
end
