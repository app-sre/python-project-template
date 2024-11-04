FROM registry.access.redhat.com/ubi9/python-311@sha256:129391e5b291e29a3b24a3fdb281a56d7cb8297bdf8ba92bb5c8581b53084324 AS test
COPY --from=ghcr.io/astral-sh/uv:0.4.29@sha256:ebb10c5178c7a357d80527f3371e7038561c26234e8a0bb323ea1f2ce8a694b7 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.11" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
