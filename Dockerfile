FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:90d72f9275f8f4e7869c42b9a1e25d5cf458c970e15dd3ed072f38a7f07dabd6 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.23@sha256:d0a0a753ab981624b49c97abc98821c1c09f4ca69d1ef5cee69c501be3d88479 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
