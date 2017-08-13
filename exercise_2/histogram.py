import sys
import psycopg2

if len(sys.argv) < 2:
    print "Too Few Arguements Provided"
    exit(1)
else:
    words  = sys.argv[1].split(',')
    print words
    # conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
    # cur = conn.cursor()
    #
    # count1 = sys.argv[1]
    # count2 = sys.argv[2]
    # cur.execute("SELECT word, count from tweetwordcount where count between %s and %s order by count desc", (count1, count2))
    # records = cur.fetchall()
    # if not cur.rowcount:
    #     print "No Record Found in Range"
    # else:
    #     for rec in records:
    #         print "%s: %s\n" %(rec[0],rec[1])
