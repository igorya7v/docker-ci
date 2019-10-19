FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

# Does nothing!
# It's just an instruction to an IT team
# that a specific port should be open.
# AWS Elastic Beanstalk does it automatically
# by checking that.
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
