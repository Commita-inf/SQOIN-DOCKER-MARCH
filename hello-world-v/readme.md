### 1. RUN a vlang program in a Docker container

run the following command to display "HELLO SQOIN" in the terminal

`docker run --rm -v "$PWD":/code:ro esolang/vlang vlang /code/main.vlang`