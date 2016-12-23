class Currency < ApplicationRecord
  has_many :rates

  def latest_rate
    rates.last
  end
end
