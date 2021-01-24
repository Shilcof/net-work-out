# NetWorkOut

NetWorkOut is a rails web application where users can view information about exercises and muscles. They can also sign up and build workouts incorporating the exercises on the app. If the exercises they desire to user are not already present, they can build them, and then they will be able to be chosen in the workout form.

Users can view all of the workouts that have been created and 'star' them to add them to their starred workouts page. They are also able to search through workouts based on their titles, featured exercises or workouts, and order by recent or most stars.

For more information on some of the functionalities incorportated please view the blog post I wrote for the project at https://robert-shilcof.medium.com/networkout-an-exercise-in-rails-17f0f67333ee, which also contains a demonstration video.

## Installation

NetWorkOut was developed on ruby-2.6.1

To run NetWorkOut on your machine, you must first download the files from this repository, and change into the main directory in your terminal.

Then you must use bundler to install the required gems.

```bash
bundle install
```

To set up the database for the application and seed it with dummy data, you must run:

```bash
rails db:migrate db:seed
```

Finally, if you desire to utilise the log in with google, emails on admin permissions granted, and amazon image hosting, you must create your own .env folder in this directory that contains:

```bash
GOOGLE_CLIENT_ID=ID_here
GOOGLE_CLIENT_SECRET=secret_here

GOOGLE_USERNAME=username_here
GOOGLE_PASSWORD=password_here

AMAZON_KEY_ID=ID_here
AMAZON_SECRET_ACCESS_KEY=secret_here
```

These constants should be kept secret to you so that others cannot use them.

## Usage

To run the application on your computer you can host it with:

```bash
rails s
```

To stop hosting the aplication, simply enter control + 'C' into the terminal where it is running.

From here you can create your own user accounts, exercises, muscles, and workouts, while interacting with the dummy data.

## Contributing
Pull requests are welcome. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License
The application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).