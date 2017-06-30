class ArchiveController < ApplicationController
  def index
    def index
      if params[:search] || params[:department]
        @jobs = JobsArchive.where("title LIKE ? AND author LIKE ? ", '%' + params[:search] + '%', "%#{params[:department]}%")
      else
        @jobs = JobsArchive.order(published: :desc).take(10)
      end
    end
  end
end
