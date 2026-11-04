FROM ruby:3.4.1-alpine
WORKDIR /app
RUN adduser -D appuser
RUN apk add --no-cache build-base
RUN chown appuser:appuser /app
COPY --chown=appuser:appuser src/email/Gemfile src/email/Gemfile.lock ./  
RUN bundle install
COPY --chown=appuser:appuser src/email/ ./ 
ENV EMAIL_PORT=6060
EXPOSE 6060
ENV APP_ENV=production
USER appuser
CMD ["bundle","exec","ruby","email_server.rb"]