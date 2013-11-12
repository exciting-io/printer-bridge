Printer Sample App
------------------

This app is (almost) the simplest possible [Printer][project page] application.
You should be able to use it to quickly get started building your own, much
more interested application.

This app is designed to demonstrate automated scheduling of content for
printers, as opposed to the human-driven [mail][] and [paint][] apps. People
who register their printers with an application like this will have content
delivered to their printer automatically on a regular basis.

You can [take a look at the source][source].

If you don’t have a printer, **why not [find out how to get or make a
printer][project page] for yourself?**

How it works
------------

All this happens automatically **without user intervention, so in this
way “publications” can be scheduled to appear** at any time.

‘Registrations’ are created by storing a print URL alongside any other
relevant information.

The `rake run` task is scheduled (in this case by Heroku, but possibly
by cron or anything else) to run at 8 am. At this time, it will send a
request for each job to its corresponding print URL, with the `url`
parameter set to a unique job URL in this app.

The printer backend server takes this page and rasterises it for the
destination printer to download.


Deploying to Heroku
-------------------

First, create the heroku app:

    heroku apps:create <app name>

Then, we'll need a few addons

    heroku addons:add heroku-postgresql
    heroku addons:add scheduler:standard

Next, set up the scheduler

    heroku addons:open scheduler

You'll want to add a `rake run` task to run probably once a day, whenever
is appropriate to send the data to the printer(s).

We need to set some configuration for the task. In this case, it's to tell
the scheduler what the URL for our application is. Don't forget to change
`<app name>` to whatever you chose above!

    heroku config:set APP_URL="http://<app name>.herokuapp.com"

Finally, deploy the actual application

    git push heroku master

Once everything starts running, you should be able to visit your application
at the URL heroku reports (probably http://<app name>.herokuapp.com) and
start registering printer(s).



More information
----------------

To find out more, you can take a look at any (or all) of the following:

-   The [introductory blog post][];
-   The [project page][];
-   The [backend server][backend server] we are running;
-   The [source for this app][source], the [mail app][mail], the
    [paint app][paint] or the
    [backend server itself][backend server source].

[example]: http://printer-weather.herokuapp.com/#example
[backend server]: http://printer.exciting.io
[register here]: http://printer-weather.herokuapp.com/register
[find out how to get or make a printer]: http://printer.exciting.io/getting-a-printer
[source]: https://github.com/exciting-io/printer-weather
[mail]: https://github.com/exciting-io/printer-mail
[paint]: https://github.com/exciting-io/printer-paint
[the Wunderground API]: http://wunderground.com
[introductory blog post]: http://exciting.io/2012/04/12/hello-printer/
[project page]: http://exciting.io/printer
[backend server source]: https://github.com/exciting-io/printer
