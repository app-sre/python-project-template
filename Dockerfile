FROM registry.access.redhat.com/ubi9/python-312@sha256:558341c02c51ee12820185b203edaa953f18d1c2ac4426947547edd9cea44ff0 AS test
COPY --from=ghcr.io/astral-sh/uv:0.8.23@sha256:94390f20a83e2de83f63b2dadcca2efab2e6798f772edab52bf545696c86bdb4 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
