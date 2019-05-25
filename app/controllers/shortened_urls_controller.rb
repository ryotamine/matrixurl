class ShortenedUrlsController < ApplicationController

  before_action :find_url, only: [:show, :shortened]
  skip_before_filter :verify_authenticity_token

  def index
    @url = ShortenedURL.new
  end

  def show
    redirect_to @url.sanitize_url
  end

  def create
    @url = ShortenedURL.new
    @url.long_url = params[:long_url]
    @url.sanitize
    if @url.new_url?
      if @url.save
        redirect_to shortened_path(@url.short_url)
      else
        flash[:error] = "Check the error below:"
        render 'index'
      end
    else
      flash[:notice] = "A short link for this URL is already in our database"
      redirect_to shortened_path(@url.find_duplicate.short_url)
    end
  end

  def shortened
    @url = ShortenedURL.find_by_short_url(params[:short_url])
    host = request.host_with.port
    @long_url = @url.sanitize_url
    @short_url = host + '/' + @url.short_url
  end

  def fetch_long_url
    fetch_url = ShortenedURL.find_by_short_url(params[:short_url])
    redirect_to fetch_url.sanitize_url
  end

  private
  def find_url
    @url = ShortenedURL.find_by_short_url(params[:short_url])
  end

  def url_params
    params.require(:url).permit(:long_url)
  end
end
