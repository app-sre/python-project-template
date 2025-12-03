FROM registry.access.redhat.com/ubi9/python-312@sha256:69aa8a11f6aef38aa5130c44ac94bad8a65e9641b7eaa0a44f04fd7decdf8be2 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.15@sha256:f739908ce28d7303646e25e4613906d23c08a69397f4a52b989aac23148ee971 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
