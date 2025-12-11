# AWS MCP

Provides access to AWS services via the MCP protocol.

## How to install

Might need to install the `uv` tool first, which is a universal MCP client:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Then, add the AWS MCP server:

```bash
claude mcp add --transport stdio aws_api_mcp_server uvx --env AWS_REGION=us-east-1 -- awslabs.aws-api-mcp-server@latest
```