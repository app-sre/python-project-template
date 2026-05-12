FROM registry.access.redhat.com/ubi9/python-312@sha256:bf2f5a3cf0c1542d2c90e729bef7e79df746e0331ab7fd19c86e3ff4792dc9f5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.14@sha256:1025398289b62de8269e70c45b91ffa37c373f38118d7da036fb8bb8efc85d97 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
