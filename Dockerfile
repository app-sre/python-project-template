FROM registry.access.redhat.com/ubi9/python-312@sha256:296739d2ac81b73257716e4eec1a25409c00b46f8d387fc287669ba62a7c1bc2 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.25@sha256:13e233d08517abdafac4ead26c16d881cd77504a2c40c38c905cf3a0d70131a6 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
