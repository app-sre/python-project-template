FROM registry.access.redhat.com/ubi9/python-312@sha256:2970a99fed0b2bc9597e6a69fb555d3ede9669007e3d113c725ef6909a53e727 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.16@sha256:2363bcbe837b6ca8fda6512a4a68de3bc752035797c159ca0ecb68c27a0d0368 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
