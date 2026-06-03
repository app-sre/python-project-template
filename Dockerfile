FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:01ed8ebbd639975c17850afb188757e819c538c5d907ccf7d36fb8634eccca69 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.18@sha256:78bc42400d77b0678ba95765305c826652ed5431f399257271dda681d0318f03 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
