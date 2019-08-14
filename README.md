# Kafka Link Prediction

This repo contains code that supports Confluent Blog post explaining how to use
Neo4j together with Kafka.

The purpose of this code is to give a worked example of how to use the two
together in a simple scenario, running inside of Docker.   This example assumes
that you have a working Confluent Cloud instance.

## Setup

Setup the "fakestream" module for simulating data sent to Kafka:

- `git submodule sync`
- `cd fakestream && pipenv install`

Set up your topics in Kafka:

- Create a topic called "recommendations"
- Create a topic called "friends"

The "out of the box" configuration assumes you are using Confluent Cloud.

Export your configuration from confluent cloud and start the Neo4j server:

``` 
export CONFLUENT_API_KEY=(your value)
export CONFLUENT_API_SECRET=(your value)
export KAFKA_BOOTSTRAP_SERVERS=(your value)

docker-compose up
```

**If you are not using Confluent Cloud and running Kafka locally**

Inspect docker-compose.yml, uncomment the correct section, and put in your
configuration.

## Stream Data to Neo4j

Have a look at the `run-stream.sh` shell script for how to use fakestream to start a stream 
of friend requests.

## Run the Examples

Take a look at the cypher files in this directory to follow along with examples from the
blog post.