class FeedreaderController < ApplicationController

  def index
    if params[:search] || params[:department]
      @jobs = Job.where("title LIKE ? AND author LIKE ? ", '%' + params[:search] + '%', "%#{params[:department]}%")
    else
      @jobs = getFeed
    end

  end

  #TODO: Refactor this as a some scheduler/task
  def getFeed
    jobs = []
    url = 'https://www.jobsatosu.com/all_jobs.atom'
    feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.each do |e|
      #update archive table, RSS feed is small enough that we can save it in an array
      job = Job.new(job_id: e.id, published: e.published, updated: e.updated, link: e.url, title: e.title, content: e.content.html_safe, author: e.author)
      if !Job.exists?(job_id: job.job_id)
        job.save
      end
      jobs << job
    end
    jobs
  end

end
