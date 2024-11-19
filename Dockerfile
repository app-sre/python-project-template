FROM registry.access.redhat.com/ubi9/python-312@sha256:c91642bdeddb1542f7081bc7846926f7741f75be4f35ef33f8908c1db236c10b AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.3@sha256:86d3ff1ee650ff0f602e5056919745847d273c2b9ff63584c4ea5119067b1836 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
