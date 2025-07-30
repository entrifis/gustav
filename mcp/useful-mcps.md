# ATLASSIAN MCP

Provides access to JIRA and Confluence via the MCP protocol.

Documentation: https://support.atlassian.com/rovo/docs/setting-up-ides/

## How to install

In a separate terminal window run

```bash
npx -y mcp-remote https://mcp.atlassian.com/v1/sse
```

Then, in the directory where you want to use the MCP, run:

```bash
claude mcp add --transport stdio atlassian "npx" -- -y mcp-remote https://mcp.atlassian.com/v1/sse
```

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