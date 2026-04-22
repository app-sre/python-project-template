FROM registry.access.redhat.com/ubi9/python-312@sha256:4a6f6abc00071bc1a9c6c327830e0aef994e0f819411de2c0fd99ea2b2fd99ff AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.7@sha256:240fb85ab0f263ef12f492d8476aa3a2e4e1e333f7d67fbdd923d00a506a516a /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
