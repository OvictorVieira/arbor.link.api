# Use the official Ruby 2.7.3 image as a base
FROM ruby:2.7.3

# Set the working directory in the Docker image
WORKDIR /app

# Set environment variables for Rails
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  default-mysql-client \
  default-libmysqlclient-dev \
  && rm -rf /var/lib/apt/lists/*

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile* /app/

# Install gems
RUN bundle install --without development test

# Copy the rest of the application into the image
COPY . /app/

# Expose the port the app runs on
EXPOSE 3000

# The command to run the application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
