FROM registry.access.redhat.com/ubi9/python-312@sha256:ca8144208a7dae8f5703a2b1c1e38d780cf0441537430c28d63f28c4791e89ab AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.18@sha256:5713fa8217f92b80223bc83aac7db36ec80a84437dbc0d04bbc659cae030d8c9 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
