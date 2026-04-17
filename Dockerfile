FROM registry.access.redhat.com/ubi9/python-312@sha256:ca77defbd2fc74d557c97ce6a5d781f280f1a607a82d3c9e8b52dd4e3a0eebd3 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.7@sha256:240fb85ab0f263ef12f492d8476aa3a2e4e1e333f7d67fbdd923d00a506a516a /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
