# production image
FROM node:18-buster-slim AS deploy
# build image (need python for some node modules)
FROM node:18-buster AS build

# Set the working directory in the image
WORKDIR /app

# Copy the contents of the current directory into the image at /app
COPY . /app

# Build everything
RUN node common/scripts/install-run-rush.js rebuild --verbose --to @demo-rushjs/express

# Use rush deploy which outputs a runnable package
FROM build AS publish
RUN mkdir -p /app/publish

RUN node common/scripts/install-run-rush.js deploy --project @demo-rushjs/express --target-folder /app/publish

# Produce the final runnable docker image
FROM deploy AS final

# Add a non-root user that the app should be run by. Ensure all app files are owned by this user.
USER root
RUN groupadd user && useradd -m -r -g user user

WORKDIR /nodeapps
COPY --from=publish /app/publish .
RUN chown -R user:user .
USER user

EXPOSE 80
CMD ["node", "./apps/express/lib/app.js"]
