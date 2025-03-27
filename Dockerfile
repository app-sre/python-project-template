FROM registry.access.redhat.com/ubi9/python-312@sha256:6dbb00fb21cb217835491dc4313c40cef3dc90cda4e409140c5c6db8e82e24da AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.10@sha256:57da96c4557243fc0a732817854084e81af9393f64dc7d172f39c16465b5e2ba /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
