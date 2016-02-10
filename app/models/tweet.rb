class Tweet < ApplicationRecord
  after_create_commit { TweetBroadcastJob.perform_later self }
end
