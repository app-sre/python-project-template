FROM registry.access.redhat.com/ubi9/python-312@sha256:558341c02c51ee12820185b203edaa953f18d1c2ac4426947547edd9cea44ff0 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.1@sha256:3b368e735c0227077902233a73c5ba17a3c2097ecdd83049cbaf2aa83adc8a20 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
