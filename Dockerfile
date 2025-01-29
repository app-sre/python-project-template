FROM registry.access.redhat.com/ubi9/python-312@sha256:40e133e24cce938460320300be5cacf16294e4493635891e8c07ca6c2d1147a8 AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.25@sha256:a73176b27709bff700a1e3af498981f31a83f27552116f21ae8371445f0be710 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
