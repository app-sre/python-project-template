FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:03bedbcb681b120a76bd9cfb9e7cbfcb0a51ab3655a1a04c17a2c94f2df420be AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.32@sha256:df4cae8f3a96d175e2e5f992e597550000edbe78fdc2594d5cd8de1a217f504c /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
