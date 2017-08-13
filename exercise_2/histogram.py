import sys
import psycopg2

if len(sys.argv) < 2:
    print "Too Few Arguements Provided"
    exit(1)
else:
    nums  = sys.argv[1].split(',')
    conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
    cur = conn.cursor()

    cur.execute("SELECT word, count from tweetwordcount where count between %s and %s order by count desc", (nums[0], nums[1]))
    records = cur.fetchall()
    if not cur.rowcount:
        print "No Record Found in Range"
    else:
        for rec in records:
            print "%s: %s\n" %(rec[0],rec[1])
