FROM registry.access.redhat.com/ubi9/python-312@sha256:945feded9d5b9fa7f1061c98f40fdb2f2b57432f800d21eaeadf85feb61d90ad AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.13@sha256:0b6dc79013b689f3bc0cbf12807cb1c901beaafe80f2ee10a1d76aa3842afb92 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
