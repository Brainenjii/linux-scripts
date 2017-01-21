#!/bin/bash

# This script stores some credentials data into file system

echo ""
echo "[Provision-Script] Installing the AWS CLI utility"
echo ""

# Store AWS credentials
if [ "$AWS_DEFAULT_REGION" ]; then
	echo "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" >> /etc/environment;
fi

if [ "$AWS_SECRET_ACCESS_KEY" ]; then
	echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> /etc/environment;
fi

if [ "$AWS_ACCESS_KEY_ID" ]; then
	echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> /etc/environment;
fi


# Store Redis connection data
if [ "$REDIS_HOST" ]; then
	echo "REDIS_HOST=$REDIS_HOST" >> /etc/environment
fi

if [ "$REDIS_PORT" ]; then
	echo "REDIS_PORT=$REDIS_PORT" >> /etc/environment
fi

if [ "$REDIS_AUTH_PASS" ]; then
	echo "REDIS_AUTH_PASS=$REDIS_AUTH_PASS" >> /etc/environment
fi

# Store MySQL connection data
if [ "$MYSQL_HOST" ]; then
	echo "MYSQL_HOST=$MYSQL_HOST" >> /etc/environment
fi

if [ "$MYSQL_USERNAME" ]; then
	echo "MYSQL_USERNAME=$MYSQL_USERNAME" >> /etc/environment
fi

if [ "$MYSQL_PASSWORD" ]; then
	echo "MYSQL_PASSWORD=$MYSQL_PASSWORD" >> /etc/environment
fi


# Store NPM registry auth token and NPM config
if [ "$NPM_API_KEY" ]; then
	echo "NPM_API_KEY=$NPM_API_KEY" >> /etc/environment;

	# We can't update token via `npm config` cause no npm installed at this
	# moment
	echo "registry=https://registry.npmjs.org/" > /etc/npmrc
	echo "progress=false" >> /etc/npmrc
	echo "//registry.npmjs.org/:_authToken=${NPM_API_KEY}" >> /etc/npmrc
fi

