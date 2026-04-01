FROM registry.access.redhat.com/ubi9/python-312@sha256:9c89d8b9ee261647a2a0020feab6281cb6675ca11038e65ec6dd20b46975b444 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.2@sha256:c4f5de312ee66d46810635ffc5df34a1973ba753e7241ce3a08ef979ddd7bea5 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
