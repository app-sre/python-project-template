FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:b6cc4d6c56a139b763af6cb9cd6b838d0f8ed5a67caadfa3418e68dec6ab755f AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.5@sha256:e85be844203885286c60ffad8a858d48afb6c5a5c237ca0e67f12e74b8f174b1 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
