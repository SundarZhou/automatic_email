class Bank < ApplicationRecord
  has_many :credit_cards

  def self.pluck_for_select
    pluck(:name, :id)
  end
end
