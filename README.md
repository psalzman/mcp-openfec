# MCP OpenFEC Server
[![smithery badge](https://smithery.ai/badge/@psalzman/mcp-openfec)](https://smithery.ai/server/@psalzman/mcp-openfec)

A Model Context Protocol (MCP) server that provides access to Federal Election Commission (FEC) campaign finance data through the OpenFEC API.

## Features

- Search for candidates by name, state, or office
- Get detailed candidate information and financial data
- Access committee information
- View individual contributions
- Track independent expenditures
- Access FEC filings and audit cases
- Download bulk data

## Requirements

- Node.js (v16 or higher)
- An OpenFEC API Key ([Get one here](https://api.data.gov/signup/))

## Installation

### Installing via Smithery

To install OpenFEC Server for Claude Desktop automatically via [Smithery](https://smithery.ai/server/@psalzman/mcp-openfec):

```bash
npx -y @smithery/cli install @psalzman/mcp-openfec --client claude
```

### Manual Installation
1. Clone the repository:
```bash
git clone https://github.com/psalzman/mcp-openfec
cd mcp-openfec
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory and add your OpenFEC API key:
```
OPENFEC_API_KEY=your_api_key_here
```

4. Build the server:
```bash
npm run build
```

## Configuration

To use this MCP server with Claude Desktop:

1. Locate your Claude Desktop configuration file:
   - macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
   - Windows: `%APPDATA%\Claude\claude_desktop_config.json`
   - Linux: `~/.config/Claude/claude_desktop_config.json`

2. Add the following configuration to the file:

```json
{
  "mcpServers": {
    "openfec": {
      "command": "node",
      "args": ["/absolute/path/to/mcp-openfec/build/server.js"],
      "env": {
        "OPENFEC_API_KEY": "your_api_key_here"
      },
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

Important configuration notes:
1. Replace `/absolute/path/to/mcp-openfec` with the actual path where you cloned the repository
2. Use absolute paths, not relative paths
3. Set `disabled` to `false` to enable the server
4. Keep `autoApprove` as an empty array for security
5. Add your OpenFEC API key in the `env` section

## Available Tools

1. `get_candidate`: Get detailed information about a candidate
2. `get_candidate_financials`: Get financial data for a candidate
3. `search_candidates`: Search for candidates by name or other criteria
4. `get_committee`: Get detailed information about a committee
5. `get_candidate_contributions`: Get individual contributions for a candidate
6. `get_filings`: Retrieve official FEC filings
7. `get_independent_expenditures`: Get independent expenditures
8. `get_electioneering`: Get electioneering communications
9. `get_party_coordinated_expenditures`: Get party coordinated expenditures
10. `get_communication_costs`: Get corporate/union communication costs
11. `get_audit_cases`: Get FEC audit cases and findings
12. `get_bulk_downloads`: Get links to bulk data downloads

## Rate Limiting

The server implements rate limiting to comply with OpenFEC API guidelines:
- 1000 requests per hour
- Requests exceeding this limit will receive an error response

## Development

To modify the server:

1. Make changes to the TypeScript files in the `src` directory
2. Rebuild the server:
```bash
npm run build
```

## License

This project is licensed under the BSD 3-Clause License - a permissive open source license that ensures maximum freedom for users while maintaining attribution requirements. The license allows you to:

- Use the code commercially
- Modify the code
- Distribute the code
- Use the code privately

With three main conditions:
1. You must include the original copyright notice
2. You must include the license text in distributions
3. You cannot use the names of contributors to endorse derived products without permission

The BSD 3-Clause License is widely used in academic and commercial settings, offering a good balance between permissiveness and protecting contributors.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2025, Phillip Salzman & Foundry Peak, LLC. All rights reserved.  Web: <a href="http://foundrypeak.com">http://foundrypeak.com/</a>

For licensing details, see the [LICENSE](LICENSE) file.
