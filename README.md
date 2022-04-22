# Gigih-Family-Catering

Gigih-Family-Catering is an API made for the Final Project of GIGIH 2.0 Backend track. See `.lesson/instructions.md` for more details. This API was made By Waldo Felix, KM_G2BE4056.

Check out the source code at github: https://github.com/waldofx/Gigih-Family-Catering

## Running the app

If you're on replit, simply hit run! You can edit the run command from the `.replit` file.
If you're running on local, then use the command `rails server` on your terminal or console.
Don't forget to use `bundle install`.

## Usage

This API contain 7 main resources routes:

-   menuitems
-   categories
-   item_categories
-   customers
-   orders
-   orderdetails
-   reports

`GET host/{resources}` display and read all available {resources}.

`GET host/{resources}/:id` display and read a specific {resources} along with some of its relation.

`GET host/{resources}/new` display a page to create a new {resources}.

`GET host/{resources}/:id/edit` display a page to update an existing {resources}.

`POST host/{resources}` sends a POST request to create a new {resource}.

`PATCH /{resources}/:id` sends a PATCH request to update an existing {resources}.

`PUT /{resources}/:id` sends a PUT request to update an existing {resources}.

`DELETE /{resources}/:id` sends a DELETE request to delete an existing {resources}.

Each of these routes are capable of CRUD (Create Read Update Delete) except for `reports` which only has a single `GET host/reports` route to index page. Reports index page display all orders on the day of the request along with customer's email and total price for each orders.

## Unit Test TTD

Use the command `bundle exec rspec -fd`.
Model and Controllers are both available for testing

# Rails on Replit

This is a template to get you started with Rails on Replit. It's ready to go so you can just hit run and start coding!

This template was generated using `rails new` (after you install the `rails` gem from the packager sidebar) so you can always do that if you prefer to set it up from scratch. The only had two make config changes we had to make to run it on Replit:

-   bind the app on `0.0.0.0` instead of `localhost` (see `.replit`)
-   allow `*.repl.co` hosts (see `config/environments/development.rb`)
-   allow the app to be iframed on `replit.com` (see `config/application.rb`)

## Running commands

Start every command with `bundle exec` so that it runs in the context of the installed gems environment. The console pane will give you output from the server but you can run arbitrary command from the shell without stopping the server.

## Database

SQLite would work in development but we don't recommend running it in production. Instead look into using the built-in [Replit database](http://docs.replit.com/misc/database). Otherwise you are welcome to connect databases from your favorite provider.

## Help

If you need help you might be able to find an answer on our [docs](https://docs.replit.com) page. Alternatively you can [ask in the community](https://replit.com/talk/ask). Feel free to report bugs [here](https://replit.com/bugs) and give us feedback [here](https://Replit/feedback).
