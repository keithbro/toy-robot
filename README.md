# Toy Robot

[![Build Status](https://travis-ci.org/keithbro/toy-robot.svg?branch=master)](https://travis-ci.org/keithbro/toy-robot)

A simulation of a toy robot that has the following commands:

* PLACE X,Y,F - places the robot on the table at coordinates X,Y facing in direction F
* LEFT - turns the robot 90 degrees to the left
* RIGHT - turns the robot 90 degress to the right
* MOVE - moves the robot forward one space
* REPORT - reports on the robot's current status in the form X,Y,F

## Getting Started

The application can be built, run and tested using Docker so Docker is the only
requirement.

To check if you have Docker installed:

    $ docker --version
    Docker version 17.03.1-ce, build c6d412e

To run the CLI:

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

Unit tests can also be run in a docker container. The following script builds
the container and runs the tests:

    $ ./dev-bin/docker-test.sh

    # Docker container is built and starts...

    ...................

    Finished in 0.0236 seconds (files took 0.12891 seconds to load)
    19 examples, 0 failures

## Design

For commentary on the design, please refer to the source code.

