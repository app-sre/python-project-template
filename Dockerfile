FROM registry.access.redhat.com/ubi9/python-312@sha256:e80ff3673c95b91f0dafdbe97afb261eab8244d7fd8b47e20ffcbcfee27fb168 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.4@sha256:9618e472e7ed9aa980719c68e51416e7ec23d85742d9ccca5c817d76ed2eb5aa /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
