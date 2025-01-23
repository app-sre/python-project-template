FROM registry.access.redhat.com/ubi9/python-312@sha256:40e133e24cce938460320300be5cacf16294e4493635891e8c07ca6c2d1147a8 AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.23@sha256:f557ee6c33abbdb0a43e93442781531ad2e71fe2e3c53ca2b0731a76e492f643 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
