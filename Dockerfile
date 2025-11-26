FROM registry.access.redhat.com/ubi9/python-312@sha256:ff88f3fc7391dcee2377eefd9f2d8802a5eaf6fefbeaae3ea9272993f8004c13 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.13@sha256:f07d1bf7b1fb4b983eed2b31320e25a2a76625bdf83d5ff0208fe105d4d8d2f5 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
