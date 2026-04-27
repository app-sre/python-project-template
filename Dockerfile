FROM registry.access.redhat.com/ubi9/python-312@sha256:0abad955c2c2e4575dc8987d76b8c49a7dd8e0679063e3118dab03c54528232f AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.8@sha256:3b7b60a81d3c57ef471703e5c83fd4aaa33abcd403596fb22ab07db85ae91347 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
