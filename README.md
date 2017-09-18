# OHA Grant Data Visualization

This is Team Progress Bars code repo for the Hawaii Annual Code Challenge 2017. We got after problem #6: Visualizing OHA Grant Data. Our solution includes data rollups, charts that are filterable and drillable, filterable data table, and data export options.

## TLDR (Quick Links)<a name="live-demo"></a>
[Live Demo](https://hacc2017-progress-bars.herokuapp.com/)
[Invision Prototype (3rd Iteration)](https://invis.io/HQDIXHZYM)
[More Details, Photos, & Video (Devpost)](https://devpost.com/software/oha-grants-data-visualization)

## Table of Contents
1. [The Challenge](#the-challenge)
2. [Live Demo](#live-demo)
3. [Team: The Progress Bars](#team-the-progress-bars)
4. [Technical Notes](#technical-notes)
    1. [Code Repository](#code-repository)
    2. [Technologies Used](#technologies-used)
5. [App Features](#app-features)
6. [How To Run It Locally](#how-to-run-it-locally)
7.  [General Approach to Challenge](#general-approach-to-challenge)
8.  [Devpost Submission](#devpost-submission)
9.  [Appendices](#appendices)
    1. [nokogiri bundle install problem](#nokogiri-bundle-install-problem)

## The Challenge: <a name="the-challenge"></a>

OHA Challenge Sponsor Tiger Li presented us with the challenge to take all the OHA grant data for awarded grants, and make it accessible to the public.

Thousands of data points were provided ... this data needed to be turned into a format where it was easy to understand from multiple point of views.

[See original challenge documents here](https://github.com/HACC17/challenges/tree/master/OHA)



<sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>

## Live Demo <a name="live-demo"></a>

https://hacc2017-progress-bars.herokuapp.com/

Please note:  The live demo is hosted on a free instance of Heroku.   That means it may take a few minutes to spin up.  So if it seems non-responsive when you first access it, please make yourself a cup of coffee and give it a few moments. You can also contact sid@sidsavara.com in case our instance somehow goes down due to being too busy, I have a second "secret" heroku instance.

<sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>



## Team: The Progress Bars 

**Team Members**

* Anees Merzi ([@yaboyanees](https://github.com/yaboyanees))
* Noah Higa ([@Namohysip](https://github.com/Namohysip))
* Sid Savara ([@sidsavara](https://github.com/sidsavara))
* Nicole Hanabusa ([@nhICS314](https://github.com/nhICS314))

<sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>


## Technical Notes <a name="technical-notes"></a>


### Code Repository <a name="code-repository"></a>

All our code is publicly available at https://github.com/HACC17/The-Progress-Bars/


### Technologies Used <a name="technologies-used"></a>

All technologies chosen are open-source and free to use.  We evaluated multiple technologies at each step to ensure they were sustainable long term projects.  We discussed with the project sponsor as well to ensure all technologies chosen were in alignment with their mission.

* [Ruby on Rails](http://rubyonrails.org/) (Ruby 2.4.1, Rails 5.1.3) as web-app framework
* [Puma](http://puma.io/) as the app server
* [HighChartsJS](https://www.highcharts.com/) as general graphing and charting library
* [SCSS](http://sass-lang.com/) for stylesheets
* [Uglifier](http://www.rubydoc.info/gems/uglifier) as compressor for JavaScript assets
*  [CoffeeScript](http://coffeescript.org/) for .coffee assets and views
* [Turbolinks](https://github.com/turbolinks/turbolinks) for Navigation 
* [jbuilder](https://github.com/rails/jbuilder) for  JSON APIs 
* [wicked_pdf](https://github.com/mileszs/wicked_pdf) for PDF executive summary
* [wkhtmltopdf-binary](https://rubygems.org/gems/wkhtmltopdf-binary) To generate PDFs from HTML
* [jQuery](https://jquery.com/) for general modern user interface
* [IntroJS](http://introjs.com/) for walk-through tutorial

Tools used that are not mandatory for final deployment:

* [Heroku](http://heroku.com) for scalable hosting
* [PostgreSQL](https://www.postgresql.org/) as the database, though as developed app is database agnostic and may use whatever the sponsor desires 
* [InvisionApp](https://www.invisionapp.com/) for prototypes

## App Features <a name="app-features"></a>

The main features provided by this app include:

* **Grant Data Sync**.  Upload fresh grant data via spreadsheet.  We discussed with two members of OHA Technical staff different options for data sync. They preferred a spreadsheet upload, which is what we provided.
* **Manipulate Graphs and Data** Through use of drill downs as well as button filters, graphs can be manipulated.  The individual data series on each graph can be toggled on or off by clicking on the series in the legends.
* **Image Download** Each graph can be exported to a PNG image for use in offline reports and presentations
* **Quick View Cards** For casual users, the cards across the top make it easy to quickly get an overview of the data before digging into the graphs
* **PDF Executive Summary** An executive summary of the dashboard can be downloaded in PDF format.
* **Data Download** Data can be downloaded from the table at the bottom, or from each graph. 
* **Live Filtered Data Table**  If a user prefers to deal with the data directly they can use multiple filters as well as an accordian style data table that hides excess data and allows them to focus on just the data that matters to them.
* **Responsive Design** The dashboard will optimize itself for whatever screen size a user accesses the app with. 
* **Tutorial Walkthrough** Clicking help walks the users through a brief wizard style tutorial.
* **Collection of FAQs and Glossary of Terms** This was provided by the project sponsor as a requirement to have in the page, so it was accomodated through accordian style FAQs.

<sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>


## How To Run It Locally 

#### Prerequisites

* Ensure you have git installed.  These instructions were tested on MacOS Sierra with **git version 2.11.0 (Apple Git-81)**
* Ensure you have **Ruby 2.4.1** and **Rails 5.1.3** installed
* Ensure you have **PostgreSQL** installed and running, and that you have the database name, username and password.  *Note: The app was tested with PostgresQL, but as written is relational database agnostic. If you are familiar with rails and prefer to use a different local database, feel free to configure your own local database along with the corresponding gem(s) and modify your database.yml accordingly.*

####  Clone repository

```
git clone https://github.com/HACC17/The-Progress-Bars.git
```

#### Navigate into directory

```
 cd The-Progress-Bars
 ```
 
 #### Configure database.yml

Create a database.yml file at The-Progress-Bars/config/database.yml with the following information filling in values for *database* , *username* and *password* as appropriate.  

```
development:
  adapter: postgresql
  encoding: utf8
  database: 
  username: 
  password:
  host: 127.0.0.1
  port: 5432
```

#### Install

While in The-Progress-Bars directory, execute:

 ```
 bundle install
 ```
 
 In the best case scenario, you end up with a lot of lines that end with:
 
 ```
 Bundle complete! 21 Gemfile dependencies, 77 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

If so, you are good to go. If not, if you had an issue with nokogiri go to [nokogiri bundle install problem](#nokogiri-bundle-install-problem)


 
 #### Run Database migrations
 
 Assuming your database.yml has been set up, while in The-Progress-Bars directory, execute:
 
  ```
 rake db:migrate
 ```
 
 This will initialize the database structure needed for the application
 
 #### Start The Rails Server
 
 With the app installed and the database configuration complete, we are ready to start the server and access the app.
 
 Still in The-Progress-Bars directory, execute:
 
 ```
 rails server
 ```
 
 If all is well, you should see something like:
 
 ```
 => Booting Puma
=> Rails 5.1.3 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.10.0 (ruby 2.4.1-p111), codename: Russell's Teapot
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://0.0.0.0:3000
Use Ctrl-C to stop
```

Congratulations! The app is running!

#### Access The App

Open a web browser and access:

```
http://localhost:3000/
```

You should see the app

##### Problem: I Get a Runtime Error

One common error you might see is:

```
Cannot load `Rails.application.database_configuration`: Could not load database configuration. No such file - ["config/database.yml"]

```

This is easy to fix.  It means you do not have a database.yml file. Go to your local machine at directory:

The-Progress-Bars/config

In that directory, create database.yml following the instructions here: [Configure database.yml](#configure-databaseyml) 

#### Load Seed Data

You can load seed data by downloading the CSV file from here:

https://drive.google.com/open?id=0BxDhpDIeJ1OQMl9OZlVRcl9BS2s

Access the app, and then click "Data Sync" in the nav bar.  Select "Choose file", find the file on your local machine, and click "Upload".  *Note: Judges if you are testing this please contact our team and we will give you the password*

<sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>

## General Approach To Challenge 

* **Design Thinking**: Discussed with users to gather empathy and understand their root problems
* **Agile**: Started with "ugly" wireframe prototypes, then progressed to static screenshots. Later used InvisionApp for two prototypes: [Prototype 1](https://invis.io/WDDIXI4C2) and [Prototype 2](https://invis.io/HQDIXHZYM) where team members and stakeholders could comment
* **Team collaboration**:  We discussed via slack, text the github pull requests and complex technology such as IRL (meeting in real life)
* **Modern, Simple Design Elements**: While Keeping the application simple and accessible, responsive design and material design was considered in building this single page app

<sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>

## Devpost Submission 

Our Devpost page, available after September 23, 2017: https://devpost.com/software/oha-grants-data-visualization

<sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>

## Appendices

### nokogiri bundle install problem

If your bundle install worked, no need to look at this. If not, you may have an issue with nokogiri, which I also came up against.  The tail end f  the console shows this:

```
An error occurred while installing nokogiri (1.8.0), and Bundler cannot continue.
Make sure that `gem install nokogiri -v '1.8.0'` succeeds before bundling.

In Gemfile:
  rails was resolved to 5.1.3, which depends on
    actioncable was resolved to 5.1.3, which depends on
      actionpack was resolved to 5.1.3, which depends on
        actionview was resolved to 5.1.3, which depends on
          rails-dom-testing was resolved to 2.0.3, which depends on
            nokogiri
```

For some reason, I have encountered issues with Nokogiri when running bundle install. If you have this issue also, while in The-Progress-Bars directory, execute:


```
gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/libxml2 --use-system-libraries
```
This takes a few minutes and takes care of that gem. Hopefully you see a message like this:

```
This could take a while...
Successfully installed nokogiri-1.8.0
1 gem installed
```

If so, then once again execute:

 ```
 bundle install
 ```
 
 Now it should work and you can continue!
 
Continue on to [Run Database migrations](#run-database-migrations)
 
 <sub><sup>[Back to top :arrow_heading_up:](#oha-grant-data-visualization)</sup></sub>