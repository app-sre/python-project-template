FROM registry.access.redhat.com/ubi9/python-312@sha256:c91642bdeddb1542f7081bc7846926f7741f75be4f35ef33f8908c1db236c10b AS test
COPY --from=ghcr.io/astral-sh/uv:0.4.29@sha256:ebb10c5178c7a357d80527f3371e7038561c26234e8a0bb323ea1f2ce8a694b7 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test