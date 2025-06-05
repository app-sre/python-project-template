FROM registry.access.redhat.com/ubi9/python-312@sha256:9d6f32c64224dd7f3a57ae5ad6a2ba62293cdf4e2e85fd3b195475ee19026c33 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.11@sha256:d7e699d374d4e5cb52a37d5c8f0ee15e3c7572850325953bf9fa8d781cfa92fc /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
