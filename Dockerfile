FROM registry.access.redhat.com/ubi9/python-312@sha256:92c71d1e64cf84b9aa6e8e81555397175b9367298b456d24eac5b55ab41fdab9 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.14@sha256:fef8e5fb8809f4b57069e919ffcd1529c92b432a2c8d8ad1768087b0b018d840 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
