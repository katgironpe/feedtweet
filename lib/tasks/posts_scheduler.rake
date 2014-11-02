desc 'Retrieve new posts'
task save_posts: :environment do
  puts 'Saving Posts ...'
  FetchPostJob.perform_later
end

desc 'Tweet posts with Short URL'
task tweet_posts: :environment do
  puts 'Tweeting Posts ...'
  TweetJob.perform_later
end
