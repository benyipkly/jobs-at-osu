# README

Ruby on Rails application that archives and provides an alternative interface for https://www.jobsatosu.com

Version: Ruby 2.3.1, Rails 5.1.1

## Deployment
Run following commands in order:
  1. ``` bundler install ```
  2. ``` rails db:migrate ```
  3. ``` rails db:getFeed ```
  3. ``` rail s ```

Get RSS Feed periodically by running ```rails db:getFeed ``` with a scheduler (e.g. crontab)




This application is not afflicated with https://www.jobsatosu.com
