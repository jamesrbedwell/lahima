# The Problem
The current system is very labour intensive, job cards are created on trello, workers are added to these, texts are sent from a type out message on trello. Once jobs are confirmed the data is manually inputted into a local database on a daily basis. Each account/worker manager then needs to validate this data from memory.

# The Goal
To create a full stack app that manages all workers, clients and jobs. It will allow users to create workers, clients, projects and jobs. It will also allow users to easily assign workers to jobs and keep track of where they are.

# The Final App
Follow the link to use the app. (You will need to have a user name and password)
http://lahima.herokuapp.com

# Tech Used
* HTML
* CSS
* JAVASCRIPT
* RUBY
* SQL
* ACTIVERECORD - ORM
* SINATRA - FRAMEWORK

# Planning
This is something that I really need to work on, especially when it comes to layout ideas. Possibly using actually wireframes rather than my dodgey sketches. 
https://github.com/jamesrbedwell/lahima/tree/master/wireframes

The entity relationship seems to be accurate. However without the required validation, it doesn't make too much sense on a client having multiple contacts.
https://github.com/jamesrbedwell/lahima/blob/master/Lahima%20ERL.xml

# Review
Overall I'm pretty happy with the way that the app works. It doesn't have the full functionality that I was hoping to achieve, however that may have been out of reach in the short period of time we had to bring the app to production.

It does lack validation, which would be one of the next steps I will look to implement.

If I was to complete the task again I would make the views more concise, I feel like a lot of infomation is currently repeated, there is circa 30 in total.

Using a CSS framework would have made the styling process a lot easier. Or planning out a style guide in more detail may have been better use of time.

# Future Steps
Refine the layout, clearer sections. Colour buttons. Provide more data.

Functionality to create new jobs, off current jobs with the same details other than.

Validation

Record of workers who have been to jobs previously, and maybe sort suggestions based off this.

Worker Ratings. Higher Rated Workers are suggested first.


