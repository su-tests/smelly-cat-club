## Smelly Cat Club

[![Build Status](https://travis-ci.org/su-tests/smelly-cat-club.svg?branch=master)](https://travis-ci.org/su-tests/smelly-cat-club)
[![Test Coverage](https://lima.codeclimate.com/github/su-tests/smelly-cat-club/badges/coverage.svg)](https://lima.codeclimate.com/github/su-tests/smelly-cat-club/coverage)
[![Dependency Status](https://gemnasium.com/badges/github.com/su-tests/smelly-cat-club.svg)](https://gemnasium.com/github.com/su-tests/smelly-cat-club)
[![Code Climate](https://lima.codeclimate.com/github/su-tests/smelly-cat-club/badges/gpa.svg)](https://lima.codeclimate.com/github/su-tests/smelly-cat-club)
[![Issue Count](https://lima.codeclimate.com/github/su-tests/smelly-cat-club/badges/issue_count.svg)](https://lima.codeclimate.com/github/su-tests/smelly-cat-club)

<img src='screenshot.png' style='height: 300px;' />

## Features

* Registration
* Email confirmation
* Invitations
* Invitations noise protection
* Pretty cat picture

## Requirements

* Ruby >= 2.1.0
* Bundler

## Install

```bash
$ git clone https://github.com/su-tests/smelly-cat-club.git
$ cd smell-cat-club
$ bundle install
$ rake db:setup
$ rails server
```

### Invitations Noise Protection

By default it is not allowed to re-send invitations by emails more often than once a day. But you can set this value in days.

```bash
export INVITATION_DELIVERY_THROTTLE_DAYS=10
```

Default: 1

## Test

```bundle exec rake```
