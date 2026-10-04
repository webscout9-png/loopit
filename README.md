# Loopit

**Open-source AI full-stack builder.**  
Bring your own API keys. Own your billing. Build in the browser.

Loopit is a browser-based AI coding environment that lets you create, edit, run, and preview full-stack web applications using natural language. It is completely free and open source. You connect your own LLM API keys — no forced subscriptions or limited credits.

---

## Why Loopit?

Most AI builders give you a small amount of credit and then charge a high monthly subscription.  
Loopit flips the model:

- You connect **your own** OpenAI, Anthropic, Google, Groq, DeepSeek, OpenRouter, Ollama, etc. keys
- You only pay the actual usage cost of the models you choose
- The platform itself is free (and will stay free / very low cost)
- Fully open source — fork it, self-host it, customize it

## Features

- **AI-powered full-stack web development** entirely in the browser
- Support for 19+ LLM providers (OpenAI, Anthropic, Gemini, Groq, DeepSeek, Ollama, OpenRouter, Mistral, xAI, and more)
- Integrated code editor, terminal, and live preview
- Git integration (clone, push, GitHub)
- Project import / export (ZIP)
- Image attachments for better context
- Diff view and version history
- Deploy to Netlify / Vercel
- Extensible via Vercel AI SDK and MCP

## Quick Start

### Prerequisites
- Node.js >= 18.18
- pnpm (recommended)

```bash
# Clone your Loopit repo
git clone https://github.com/webscout9-png/loopit.git
cd loopit

# Install dependencies
pnpm install

# Start the development server
pnpm run dev
```

Open http://localhost:5173 and add your API keys in the Settings panel.

### Environment Variables (optional)

Copy `.env.example` to `.env.local` and fill in any keys you want available by default:

```bash
cp .env.example .env.local
```

You can also enter API keys directly in the UI (they stay in your browser).

## Available Scripts

| Command              | Description                          |
|----------------------|--------------------------------------|
| `pnpm run dev`       | Start development server             |
| `pnpm run build`     | Production build                     |
| `pnpm run start`     | Run production build locally         |
| `pnpm run dockerbuild` | Build Docker image                 |
| `pnpm run typecheck` | TypeScript check                     |

## Self-Hosting & Docker

See the `Dockerfile` and `docker-compose.yaml` for containerized deployment.

## License

MIT

---

**Loopit** — Build anything. Own everything.
