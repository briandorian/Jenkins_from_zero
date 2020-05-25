#Dockerfile

FROM ruby:2.5
# We install the needed dependancies and create a new directory on the container
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev sqlite3 nodejs
RUN mkdir /myapp
WORKDIR /myapp
# We moved to the working directory then copied the gemfile
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
# Install RoR with the Gemfile provided
RUN bundle install
# Move the application to the myapp folder
COPY . /myapp
