FROM registry.access.redhat.com/ubi9/python-312@sha256:ff88f3fc7391dcee2377eefd9f2d8802a5eaf6fefbeaae3ea9272993f8004c13 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.12@sha256:0eaa66c625730a3b13eb0b7bfbe085ed924b5dca6240b6f0632b4256cfb53f31 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
