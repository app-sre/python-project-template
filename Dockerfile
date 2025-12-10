FROM registry.access.redhat.com/ubi9/python-312@sha256:3da39d0c938994161bdf9b6b13eb2eacd9a023c86dd5166f3da31df171c88780 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.17@sha256:5cb6b54d2bc3fe2eb9a8483db958a0b9eebf9edff68adedb369df8e7b98711a2 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
