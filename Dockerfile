FROM debian as builder
RUN apt-get update && apt-get install -y gettext

WORKDIR /app
COPY .env ./
COPY maintenance.html.template ./
RUN export $(grep -v '^#' .env | xargs) && envsubst < maintenance.html.template > /result.html

FROM nginx
RUN rm /usr/share/nginx/html/index.html
COPY --from=builder /result.html /usr/share/nginx/html/index.html