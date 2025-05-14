FROM registry.access.redhat.com/ubi9/python-312@sha256:306e4320c559d67c60874e3bb85c9f84afc84b66c350b3d4afe0abd65201d6e6 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.3@sha256:87a04222b228501907f487b338ca6fc1514a93369bfce6930eb06c8d576e58a4 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
