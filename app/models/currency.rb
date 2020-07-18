class Currency < ApplicationRecord
  has_many :credit_card_records

  def self.pluck_for_select
    pluck(:name, :id)
  end
end
