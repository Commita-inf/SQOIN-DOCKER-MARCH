FROM thevlang/vlang:latest

WORKDIR /app

COPY main.v .

RUN v -prod -o app main.v

CMD ["./app"]
