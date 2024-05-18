# Big Data Managment (LTAT.02.003) projects

This repository contains code for projects of the Big Data Managment (LTAT.02.003) course (spring 2024) in University of Tartu.

Team members:

* Mattias Väli
* Joosep Tavits
* Rimmo Rõõm
* Kermo Saarse

## Setup

1. Review the `Dockerfile`.

2. Navigate to the same folder as `Dockerfile` on command line.

3. Build the image by running `docker build . -t "pyspark-delta:0.0.1"`

## Running the code

1. Start the Docker container `docker compose up -d`

2. Open `localhost:8888` in your browser.

3. You can work with the files under `mnt` folder in JupyterLab UI.
