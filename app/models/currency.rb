class Currency < ApplicationRecord
  has_many :rates

  def latest_rate
    rates.last
  end

  def previous_rate
    (rates.last(2).reverse - [latest_rate]).first
  end

end
