FROM registry.access.redhat.com/ubi9/python-312@sha256:99f6d9e3d833b0b35db30f53a104846d7e4f811531d16602b2867dcfeed9a17b AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.16@sha256:440fd6477af86a2f1b38080c539f1672cd22acb1b1a47e321dba5158ab08864d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
