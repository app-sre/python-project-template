FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:1ef40558aa44913478db2b564b4daf9ae67e5ecf72f5b46a433bd21f916ba4d1 AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.24@sha256:3af4716e991d6956a41e573eab705d0ee08500cd829ed30293eb8472f372c65a /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
