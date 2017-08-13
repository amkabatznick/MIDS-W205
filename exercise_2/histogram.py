import sys
import psycopg2

if len(sys.argv) < 3:
    print "Too Few Arguements Provided"
    exit(1)
else:
    count1 = sys.argv[1]
    count2 = sys.argv[2]
    cur.execute("SELECT word, count from tweetwordcount where count between %s and %s order by count", (count1, count2))
    records = cur.fetchall()
    if not cur.rowcount:
        print "No Record Found in Range"
    else:
        for rec in records:
            print "%s: %s\n" %(rec[0],rec[1])
