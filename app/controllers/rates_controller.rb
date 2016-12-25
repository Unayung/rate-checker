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
end
