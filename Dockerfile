FROM registry.access.redhat.com/ubi9/python-312@sha256:46f883684d02cef2a7abb0c4124f18308ad920018d76c5c56f130dae02bfed05 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.25@sha256:13e233d08517abdafac4ead26c16d881cd77504a2c40c38c905cf3a0d70131a6 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
