FROM registry.access.redhat.com/ubi9/python-312@sha256:2e987ec4db7e45d01a4eb18d1c480b54c5f3886374c7a8bf9a6c6517547ffd75 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.10@sha256:29bd45092ea8902c0bbb7f0a338f0494a382b1f4b18355df5be270ade679ff1d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
