class FeedreaderController < ApplicationController

  def index
    if params[:search] || params[:department]
      @jobs = Job.where("title LIKE ? AND author LIKE ? ", '%' + params[:search] + '%', "%#{params[:department]}%")
    else
      @jobs = Job.all
    end

  end
end
