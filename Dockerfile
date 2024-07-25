#Base image taken from:https://github.com/cypress-io/cypress-docker-images
#node-20.14.0-chrome-125.0.6422.141-1-ff-126.0.1-edge-125.0.2535.85-1
#cypress/browsers:latest
#docker pull cypress/included:3.2.0
#docker pull cypress/included:38.0
#docker build -t mycypressimage:1.1.0 .
FROM cypress/browsers:node14.17.0-chrome91-ff89
#Create the folder where our project will be stored
RUN mkdir /my-cypress-project
#We make it our workdirectory
WORKDIR /my-cypress-project
#Let's copy the essential files that we MUST use to run our scripts.
COPY ./package.json .
COPY ./cypress.config.js .
COPY ./cypress ./cypress
#Install the cypress dependencies in the work directory
RUN npm install
#Executable commands the container will use[Exec Form]
ENTRYPOINT ["npx","cypress","run"]
#With CMD in this case, we can specify more parameters to the last entrypoint.
CMD [""]    