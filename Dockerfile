FROM registry.access.redhat.com/ubi9/python-312@sha256:f17b0788b7eff1683ff8ba7c6a17b907648753d489e8d7d3975eaf6c41644287 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.4@sha256:35aca64ac15f61941da93e92ebfb22220359e95056e6a827f4aef2235c4d353f /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
