import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

if len(sys.argv) > 2:
    print "Too Many Arguements Provided"
    exit(1)
else:
    conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
    cur = conn.cursor()

    if len(sys.argv) == 1:
        cur.execute("SELECT word, count from tweetwordcount order by word")
        records = cur.fetchall()
        for rec in records:
            print "(%s,%s)\n" %(rec[0],rec[1])
    else:
      word = sys.argv[1]
      word = word.lower()
      cur.execute("SELECT count from tweetwordcount WHERE word=%s", (word,))
      if not cursor.rowcount:
        print 'Total number of occurrences of "%s": %s"' %(word,0)
      else:
        print 'Total number of occurrences of "%s": %s"' %(word,cur.fetchone()[0])

    conn.commit()
    conn.close()
