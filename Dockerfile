FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:03bedbcb681b120a76bd9cfb9e7cbfcb0a51ab3655a1a04c17a2c94f2df420be AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.28@sha256:0f36cb9361a3346885ca3677e3767016687b5a170c1a6b88465ec14aefec90aa /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
