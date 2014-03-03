Printer Bridge
------------------

This is a just-enough-to-work proof-of-concept bridge for connecting publication content services designed for BERG's Little Printer with the less-sophisticated-but-open-source [Printer][project page] project.

You'll need to know the URL for a publication, which almost certainly means that it's a publication you've written yourself, since BERG don't expose the URLs of the publications they use. This bridge will make a periodic print request for any registered printers to publications, including the date parameter that Little Printer publications expect.


CAVEAT EMPTOR
----------

There's a ton of functionality that this bridge does NOT implement; it will not send the edition count, or any custom user data, or anything else fancy like that. It is almost certainly too simple to be useful to anyone unless they know how to plug different web services together.

However, if you want to improve it and/or make it more robust, please do go ahead!



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
[source]: https://github.com/exciting-io/printer-bridge
[mail]: https://github.com/exciting-io/printer-mail
[paint]: https://github.com/exciting-io/printer-paint
[the Wunderground API]: http://wunderground.com
[introductory blog post]: http://exciting.io/2012/04/12/hello-printer/
[project page]: http://exciting.io/printer
[backend server source]: https://github.com/exciting-io/printer
