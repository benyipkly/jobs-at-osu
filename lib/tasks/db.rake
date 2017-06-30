namespace :db do
  desc 'Archive RSS feed from jobsatosu'
  task getFeed: :environment do
    url = 'https://www.jobsatosu.com/all_jobs.atom'
    feed = Feedjira::Feed.fetch_and_parse url
    Job.delete_all
    feed.entries.each do |e|
      job = Job.create(job_id: e.id, published: e.published, updated: e.updated, link: e.url, title: e.title, content: e.content.html_safe, author: e.author)
      jobsarchive = JobsArchive.new(job_id: e.id, published: e.published, updated: e.updated, link: e.url, title: e.title, content: e.content.html_safe, author: e.author)
      if !JobsArchive.exists?(job_id: job.job_id)
        jobsarchive.save
      end
    end
  end
end
