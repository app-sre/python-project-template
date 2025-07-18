FROM registry.access.redhat.com/ubi9/python-312@sha256:c9a967a1cf947f2374f45d8817f5328f4893be6b0d5749d2287f1db8ed429675 AS test
COPY --from=ghcr.io/astral-sh/uv:0.8.0@sha256:5778d479c0fd7995fedd44614570f38a9d849256851f2786c451c220d7bd8ccd /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
