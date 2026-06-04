FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:ee3ee7060695da0bc102a0dc523b76ae4332daf5909ef2f01a07d6feccd9bab2 AS test
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
