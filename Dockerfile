FROM registry.access.redhat.com/ubi9/python-312@sha256:945feded9d5b9fa7f1061c98f40fdb2f2b57432f800d21eaeadf85feb61d90ad AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.14@sha256:3362a526af7eca2fcd8604e6a07e873fb6e4286d8837cb753503558ce1213664 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
