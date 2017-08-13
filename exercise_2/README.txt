Instructions for running the program:

For a complete overview of the program design and dependencies visit the Architecture.pdf file in this directory.

Make sure you are in the directory: MIDS-W205/exercise_2 to start.

1. First you must set up your Twitter Api credentials and then properly set up the reference in the code. 
	A. First log into Twitter: https://www.twitter.com/
	B. Next Create a New App: https://apps.twitter.com/
	C. Once you App has been set up, go to the Keys and Access Tokens Tabs and click “Create my access token”. 
	D. Once your tokens have been set up, go to your EC2 instance and export these variables, using the command line prompts below:
		$export TWITTER_CONSUMER_KEY=“YourConsumerKey”
		$export TWITTER_CONSUMER_SECRET=“YourConsumerSecret”
		$export TWITTER_ACCESS_TOKEN=“YourAccessToken”
		$export TWITTER_ACCESS_SECRET=“YourAccessSecret”
		
		
	    This will keep your access keys private to external viewers of the code, while also allowing you to reference these values in your code.

2. Next set up the requisite database and table using the create_database.py file. You can achieved this via the command line prompt:
$python create_database.py

3. Once the databases have been properly installed navigate to the subdirectory /extweetwordcount. This can be achieved by using the command line prompt:
$cd extweetwordcount/

You can then confirm your directory is correct using the PWD command on the command line.

4. Once we are in this the /extweetwordcount directory we can run our twitter stream using the command line prompt:
$sparse run

An example of what this stream looks like when it is properly running can be found at MIDS-W205/exercise_2/screenshots/screenshot-twitterStream.png

One this has run for 15-30 minutes, you can kill the stream with Control-C

5. Once finishing the stream, return the the main excercise_2 directory. This can be done using the command line prompt:
$cd ..

6. Once back in the exercise_2 directory, you can run the histogram.py and finalresults.py files.
	A. The finalresults.py file can run with one input or no inputs. It returns a word or words with their corresponding counts. Examples can be found at MIDS-W205/exercise_2/screenshots/screenshot-finalresults.png
		I. If called with an input it will return the number of occurrences of that word over our sparse run.  
			-This can be achieved using the command line prompt: $python finalresults.py word
			
		II. If called without a word input it will return all results alphabetically.
			--This can be achieved using the command line prompt: $python finalresults.py
	B. The histogram.py function returns all words that are between the minimum and maximum number of occurances and takes 2 inputs. The first input is the minimum characters and the second is the maximum number of charters.
		I. The function can be called using the command line prompt: $python histogram.py min_chars,mar_chars. A working example can be found at MIDS-W205/exercise_2/screenshots/screenshot-histogram.png
			
