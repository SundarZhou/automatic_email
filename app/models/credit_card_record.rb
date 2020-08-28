class CreditCardRecord < ApplicationRecord
  belongs_to :credit_card
  belongs_to :currency
  belongs_to :repayment_record, required: false

  delegate :name, :to => :currency, :allow_nil => true, :prefix => true
  def select_message
    "(#{credit_date})#{credit_card.bank_name}-#{credit_card.sort_number}-#{amount}"
  end

  def self.pluck_for_select
    all.map{|c| [c.select_message, c.id]}
  end
end
