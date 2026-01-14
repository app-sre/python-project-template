FROM registry.access.redhat.com/ubi9/python-312@sha256:a0a5885769d5a8c5123d3b15d5135b254541d4da8e7bc445d95e1c90595de470 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.25@sha256:13e233d08517abdafac4ead26c16d881cd77504a2c40c38c905cf3a0d70131a6 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
