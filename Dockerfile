
FROM node:latest



#RUN mkdir /log

WORKDIR /dapp
#COPY app/package-lock.json /dapp/app/package-lock.json 
#COPY app/package.json /dapp/app/package.json
#COPY app/webpack.config.js /dapp/app/webpack.config.js
#COPY app/src/index.js /dapp/app/smart-contracts/src/index.js
#COPY app/src/index.html /dapp/app/smart-contracts/src/index.html
COPY app /dapp/app
COPY build /dapp/build
COPY contracts /dapp/contracts
COPY migrations /dapp/migrations
COPY package-lock.json /dapp/package-lock.json
COPY truffle-config.js /dapp/truffle-config.js
RUN npm i
#RUN npm install #--no-progress --ignore-optional
#RUN npm i truffle -g 
#RUN ["truffle", "compile"]
#RUN ["truffle", "migrate "]
#COPY src/build    /dapp/app/src/build
WORKDIR /dapp/app
RUN npm i
CMD ["npm", "run", "build"]
CMD ["npm", "run", "dev"]
#EXPOSE 7545
EXPOSE 3000
