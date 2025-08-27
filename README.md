# Figma MCP Plugin for Cursor

This guide will help you set up the Figma MCP (Model Context Protocol) plugin in Cursor to enable AI-powered Figma interactions.

## Prerequisites

- [Cursor](https://cursor.sh/) installed on your system
- [Node.js](https://nodejs.org/) (version 18 or higher)
- A Figma account with access to the files you want to work with

## Setup Steps

### 1. Install Dependencies

```bash
npm install
```

### 2. Get Your Figma Access Token

1. Go to [Figma Settings](https://www.figma.com/settings)
2. Navigate to "Account" tab
3. Scroll down to "Personal access tokens"
4. Click "Create new token"
5. Give it a name (e.g., "Cursor MCP Plugin")
6. Copy the generated token (you won't be able to see it again)

### 3. Configure Cursor MCP Settings

1. Open Cursor
2. Go to **Settings** (Cmd/Ctrl + ,)
3. Search for "MCP" or navigate to **AI** → **MCP Servers**
4. Click **Add MCP Server**
5. Fill in the following details:

**Server Name:** `figma-mcp`
**Command:** `npx @sethdouglasford/mcp-figma`
**Arguments:** Leave empty
**Environment Variables:**
```
FIGMA_ACCESS_TOKEN=your_figma_token_here
```

### 4. Alternative: Manual MCP Server Setup

If the above method doesn't work, you can manually configure the MCP server:

1. Create a configuration file in your home directory:
   - **macOS/Linux:** `~/.cursor/mcp-servers.json`
   - **Windows:** `%APPDATA%\Cursor\mcp-servers.json`

2. Add this configuration:

```json
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["@sethdouglasford/mcp-figma"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "your_figma_token_here"
      }
    }
  }
}
```

### 5. Restart Cursor

After configuring the MCP server, restart Cursor for the changes to take effect.

## Usage

Once configured, you can use the Figma MCP plugin in Cursor:

- **View Figma files:** Ask the AI to show you specific Figma designs
- **Extract design tokens:** Get colors, typography, and spacing information
- **Analyze designs:** Get insights about design patterns and components
- **Export assets:** Request specific design elements or assets

## Example Commands

- "Show me the design tokens from [Figma file URL]"
- "What are the main colors used in this design?"
- "Extract the typography scale from [Figma file]"
- "Show me the component hierarchy in [Figma file]"

## Troubleshooting

### Common Issues

1. **"MCP server not found"**
   - Ensure the server name matches exactly in Cursor settings
   - Check that the command path is correct

2. **"Authentication failed"**
   - Verify your Figma access token is correct
   - Ensure the token has the necessary permissions

3. **"Server connection failed"**
   - Check that Node.js is installed and accessible
   - Verify the MCP server package is installed

### Debug Mode

To enable debug logging, add this environment variable:
```
DEBUG=mcp:*
```

## Support

- [MCP Documentation](https://modelcontextprotocol.io/)
- [Figma API Documentation](https://www.figma.com/developers/api)
- [Cursor Documentation](https://cursor.sh/docs)

## License

MIT
