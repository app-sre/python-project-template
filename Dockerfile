FROM registry.access.redhat.com/ubi9/python-312@sha256:7ba356eca7f476bcf9a8c51714e43353376d37e0bbd4e43ceec7b1bcc6ff9675 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.4@sha256:5164bf84e7b4e2e08ce0b4c66b4a8c996a286e6959f72ac5c6e0a3c80e8cb04a /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
