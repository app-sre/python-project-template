FROM registry.access.redhat.com/ubi9/python-312@sha256:f31ec4256ccaeca491b18727cb9aa515a85844193835f5343ee40028a35d1975 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.2@sha256:3b898ca84fbe7628c5adcd836c1de78a0f1ded68344d019af8478d4358417399 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
