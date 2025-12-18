FROM registry.access.redhat.com/ubi9/python-312@sha256:cd327a3ff52f02bcbb9985d09e5af8b15029d27ff5aae982f6e451e7a52c3d96 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.18@sha256:5713fa8217f92b80223bc83aac7db36ec80a84437dbc0d04bbc659cae030d8c9 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
