FROM registry.access.redhat.com/ubi9/python-312@sha256:945feded9d5b9fa7f1061c98f40fdb2f2b57432f800d21eaeadf85feb61d90ad AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.16@sha256:db305ce8edc1c2df4988b9d23471465d90d599cc55571e6501421c173a33bb0b /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
