from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
from nltk.corpus import stopwords



class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        self.conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        self.stopWords = set(stopwords.words('english'))

    def process(self, tup):
        word = tup.values[0]
        word = word.lower()

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount
        # Table name: Tweetwordcount
        # you need to create both the database and the table in advance.
        cur = self.conn.cursor()
        if word not in self.stopWords:
            cur.execute("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word.encode('utf8'),))
            if cur.rowcount == 0:
                cur.execute("INSERT INTO tweetwordcount (word,count) \
                      VALUES (%s, 1)",(word.encode('utf8'),))
            # Increment the local count
            self.counts[word] += 1
            self.emit([word, self.counts[word]])

             # Log the count - just to see the topology running
             self.log('%s: %d' % (word, self.counts[word]))
              
        self.conn.commit()
