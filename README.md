<p align="center">
  <img src="https://uploads-ssl.webflow.com/6279e57369b082b63476a825/6279e57369b082f26a76a859_Asset%204%201.svg" alt="Neurogram">
</p>

[![Tests](https://github.com/Neurogram-tech/neurogram-mono/actions/workflows/ci.yml/badge.svg)](https://github.com/Neurogram-tech/neurogram-mono/actions/workflows/ci.yml) ![Staging Status](https://img.shields.io/website?url=https%3A%2F%2Ftesting.stag.neurogram.com%2F&label=staging)

Neurogram is a high-technology ecosystem to serve neurophysiologists and researchers, expanding the neuroscience frontiers with features beyond the conventional.

## Table of Contents

- [Getting started](#getting-started)
- [Setup with ASDF](#setup-with-asdf)
- [Setup with Docker](#setup-with-docker)
- [Deployment](#deployment)

## Getting started

> Officially supported version is `22.04.2 LTS`. Although the project may work on other versions of Ubuntu or operating systems, we cannot guarantee an experience as optimized as in version 22.04.2 LTS.

Clone the project from github:

```shell
git clone git@github.com:ricardopacheco/auction_core_api.git api
cd api
```

> Configure the environment variables according to your development and testing environment.

## Setup with ASDF

> Read the asdf documentation [here](https://asdf-vm.com/#/core-manage-asdf). It contains the asdf setup process for your OS. As long as asdf has been installed and is working, navigate to the folder where you cloned the project and perform the following steps:

First all, environment variables should be properly configured:

```shell
cp lib/templates/.env.development.template .env
cp lib/templates/.env.test.template .env.test
```

### OSX

- [XCode](https://developer.apple.com/xcode/)
- [Homebrew](https://brew.sh/)
- [Brewfile](https://github.com/Homebrew/homebrew-bundle)

> The setup on macOS may be incomplete. Pay attention to the requested dependencies, and update this section of the document if something is missing.

```shell
# Install XCode Command Line Tools if not installed
xcode-select --install

# Will detect the operating system and install dependencies and backing services
./devops/development/setup
```

### Ubuntu

```shell
# Will detect the operating system and install dependencies and backing services
./devops/development/setup
```

## Setup with Docker

You will need to have `docker` and `docker compose` installed to run the project correctly. Install according to your OS's official documentation:

- [`docker`](https://docs.docker.com/engine/install/)
- [`docker-compose`](https://docs.docker.com/compose/install/)

To verify that docker is working correctly, run the `docker --version` and `docker compose --version` commands. If the output of the command is the same like `Docker version 20.10.23, build 7155243` and `Docker Compose version v2.15.1` your installation should be ok. After that:

Environment variables should be properly configured:

```shell
cp lib/templates/.env.development.template .env
cp lib/templates/.env.test.template .env.test
```

Now, create a database and running services

```shell
docker compose run app bash
bundle exec rake 'auction_fun_core:db:create_database[postgres]'
```
