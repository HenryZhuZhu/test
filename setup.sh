#!/bin/bash

echo "🚀 Setting up Figma MCP Plugin for Cursor..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first:"
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18 or higher is required. Current version: $(node -v)"
    echo "   Please update Node.js: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js $(node -v) detected"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

# Create Cursor config directory if it doesn't exist
CURSOR_CONFIG_DIR="$HOME/.cursor"
if [ ! -d "$CURSOR_CONFIG_DIR" ]; then
    echo "📁 Creating Cursor configuration directory..."
    mkdir -p "$CURSOR_CONFIG_DIR"
fi

# Copy MCP configuration
echo "⚙️  Setting up MCP configuration..."
cp .cursor/mcp-servers.json "$CURSOR_CONFIG_DIR/"

echo ""
echo "🎉 Setup complete! Here's what you need to do next:"
echo ""
echo "1. Get your Figma access token:"
echo "   - Go to https://www.figma.com/settings"
echo "   - Navigate to Account → Personal access tokens"
echo "   - Create a new token"
echo ""
echo "2. Update the MCP configuration:"
echo "   - Edit: $CURSOR_CONFIG_DIR/mcp-servers.json"
echo "   - Replace 'your_figma_access_token_here' with your actual token"
echo ""
echo "3. Restart Cursor"
echo ""
echo "4. Test the plugin by asking Cursor about Figma files!"
echo ""
echo "📚 For detailed instructions, see README.md"




