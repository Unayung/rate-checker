# require 'rake'
class Rate < ApplicationRecord
  belongs_to :currency

  def self.update
    %x[rails rates:updater]
  end
end
