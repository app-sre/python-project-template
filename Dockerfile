FROM registry.access.redhat.com/ubi9/python-312@sha256:e80ff3673c95b91f0dafdbe97afb261eab8244d7fd8b47e20ffcbcfee27fb168 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.7@sha256:83285c39ee68ed64708fca1495c2d0aad084e9ac02a8910f5180b8e36bcf803a /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
