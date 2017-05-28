class AstrosController < ApplicationController
  def feed
    @astros = Astro.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end
