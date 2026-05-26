FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:0c5b5d198178280e65577e63251ee5ee49435e1a711bef4e4b5b471723e0ed3c AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.16@sha256:440fd6477af86a2f1b38080c539f1672cd22acb1b1a47e321dba5158ab08864d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
