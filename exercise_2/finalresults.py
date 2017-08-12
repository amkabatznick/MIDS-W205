import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv) == 2:
  word = sys.argv[1]
  cur.execute("SELECT count from tweetwordcount WHERE word=%s", (word,))
  #record =
  print('Total number of occurrences of "',word,'": ',cur.fetchone()[0])
