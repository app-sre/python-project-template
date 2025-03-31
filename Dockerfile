FROM registry.access.redhat.com/ubi9/python-312@sha256:6dbb00fb21cb217835491dc4313c40cef3dc90cda4e409140c5c6db8e82e24da AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.11@sha256:fb91e82e8643382d5bce074ba0d167677d678faff4bd518dac670476d19b159c /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
