FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:8114f8e3f19a4d5b0cc2f0022e409dee5f296d69207aa489a892c01b8ab4a17f AS test
COPY --from=ghcr.io/astral-sh/uv:0.13.5@sha256:32a7bb39b496babbd997b0a39a4d66c126bdaf5661b302bf6f06abda8deca6ff /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
