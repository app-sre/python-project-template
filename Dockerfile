FROM registry.access.redhat.com/ubi9/python-312@sha256:d45384e6becad42c7e53f47146f51b661b9ad678636dcb3d2fb565a024c6c7ab AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.16@sha256:440fd6477af86a2f1b38080c539f1672cd22acb1b1a47e321dba5158ab08864d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
