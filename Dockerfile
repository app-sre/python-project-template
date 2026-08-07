FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:d907e1e16ec2aa81ef53e12e751af3ecc96ec0f9d08df0f6c757e6c95fe20198 AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.3@sha256:2d890623d310b57771ce840f0da5eed5fc6d657da05ffaa45d82797b53fa3abc /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
