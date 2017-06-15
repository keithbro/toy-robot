# Toy Robot

[![Build Status](https://travis-ci.org/keithbro/toy-robot.svg?branch=master)](https://travis-ci.org/keithbro/toy-robot)

## Getting Started

    $ ./bin/docker-build-and-run.sh

    # Docker container is built and starts...

    Robot is ready to accept commands, type EXIT to exit.
    PLACE 2,3,NORTH
    REPORT
    2,3,NORTH
    MOVE
    REPORT
    2,4,NORTH
    LEFT
    REPORT
    2,4,WEST
    MOVE
    REPORT
    1,4,WEST
    MOVE
    REPORT
    0,4,WEST
    EXIT

    $

## Running Unit Tests

    $ ./dev-bin/docker-test.sh

