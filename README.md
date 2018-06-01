# Demo Rails Blog App

Very simple demonstration blog application in Rails with Rspec tests. Comes with Docker support.

See Gemfile for dependencies.

## Running

To run production server in Docker:

```
docker-compose up
```

For dev mode:

```
docker-compose -f docker-compose-dev.yml run blog
```

Which will open a bash prompt to the webserver container to run `rails s` or `rails g` and so on for development. Then in a separate terminal, run:

```
docker-compose -f docker-compose-dev.yml run tester
```

which runs Guard with Rspec for automated tests.
