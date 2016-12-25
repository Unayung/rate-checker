class RatesController < ApplicationController
  def feed
    @currencies = Currency.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @rate = Rate.find(params[:id])
  end

  def index
    @currencies = Currency.all
    latest_rate = Rate.last
    @timestamp = latest_rate.updated_at
  end

  def refresh
    Rate.update
    redirect_to rates_path
  end
end
