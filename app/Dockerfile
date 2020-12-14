
FROM node:latest



#RUN mkdir /log

WORKDIR /dapp/app
COPY package-lock.json /dapp/app/package-lock.json 
COPY package.json /dapp/app/package.json
COPY webpack.config.js /dapp/app/webpack.config.js
COPY src/index.js /dapp/app/smart-contracts/src/index.js
COPY src/index.html /dapp/app/smart-contracts/src/index.html



RUN npm install #--no-progress --ignore-optional
#COPY src/build    /dapp/app/src/build

CMD ["npm", "run", "build"]
CMD ["npm", "run", "dev"]
EXPOSE 3000
