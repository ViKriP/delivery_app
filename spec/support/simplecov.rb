require 'simplecov'

SimpleCov.start 'rails' do
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/channels'
end
