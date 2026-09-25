FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:6ea702d478f66cf78fb694d2fc2634f353c3f49c54fbbe58ba39288a59c83aa7 AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.19@sha256:04d046b13e60d6bcec73cbc5e1cad25d680dea90c8573340950a0ac2d1aef424 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
