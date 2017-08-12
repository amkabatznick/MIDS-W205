import tweepy
import os
import sys

#All environment variables can be set using:
# A. On MAC or Linux: export Key_Name = "Key Value"
# B. On Windows: set Key_Name = "Key Value"


try:
    consumer_key = os.environ['TWITTER_CONSUMER_KEY']
    consumer_secret = os.environ['TWITTER_CONSUMER_SECRET']
    access_token = os.environ['TWITTER_ACCESS_TOKEN']
    access_secret = os.environ['TWITTER_ACCESS_SECRET']
except:
    sys.stderr.write("TWITTER_ * environment variables not set \n")
    sys.exit(1)

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)



api = tweepy.API(auth)
