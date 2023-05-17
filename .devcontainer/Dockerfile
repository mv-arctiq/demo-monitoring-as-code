ARG IMG_BASE="mcr.microsoft.com/devcontainers"
ARG IMG_TYPE="python"
ARG IMG_VERSION="3.9"
FROM "${IMG_BASE}/${IMG_TYPE}:${IMG_VERSION}"

ARG TF_SEC_SCRIPT="https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh"
ARG TF_DOC_SCRIPT="https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-linux-arm64.tar.gz"
ARG TF_LINT_SCRIPT="https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh"
RUN pip install pre-commit \
    && curl -s "$TF_LINT_SCRIPT" | bash \
    && curl -s "$TF_SEC_SCRIPT" | bash \
    && curl -Lo ./tf-docs.tar.gz "$TF_DOC_SCRIPT" \
    && tar -xzf tf-docs.tar.gz \
    && chmod +x terraform-docs \
    && mv terraform-docs /usr/local/bin/terraform-docs

