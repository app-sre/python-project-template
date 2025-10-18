FROM registry.access.redhat.com/ubi9/python-312@sha256:f17b0788b7eff1683ff8ba7c6a17b907648753d489e8d7d3975eaf6c41644287 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.4@sha256:8df9507a0628cab2dff41dcc7c7979e57089300d0b70f8fa2334a0015640437d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
