# Toy Robot
- test
[![Build Status](https://travis-ci.org/keithbro/toy-robot.svg?branch=master)](https://travis-ci.org/keithbro/toy-robot)

![Wall-E](http://68.media.tumblr.com/tumblr_m193kxpQYA1qhigt0o1_500.gif)

A simulation of a toy robot on a tabletop that has the following commands:

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

If you don't want to use Docker and have Ruby already installed you can do:

    $ bundle install # the only requirement is rspec

    $ ruby -I lib bin/toy-robot-cli

Sample CLI output will be:

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

Or without Docker:

    $ rspec --format doc

A Travis-CI project has been created (build status and link is at the top of
the README) that runs the test suite on every commit.

## Design

For commentary on the design, please refer to the commentary that you will find
inside the source code.

## License

Copyright (C) Keith Broughton.

This library is free software; you can redistribute it and/or modify
it under the same terms as Ruby itself.

