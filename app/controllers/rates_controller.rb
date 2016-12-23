class RatesController < ApplicationController
  def feed
    @currencies = Currency.all
    @latest_rates = {}
    @currencies.each do |c|
      @latest_rates.store(c.name, c.latest_rate)
    end
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @rate = Rate.find(params[:id])
  end
end
