# WhatsApp Campaign Management System with AI

A full-featured WhatsApp campaign management system with AI-powered message variations, sentiment analysis, and intelligent reply suggestions.

## Features

- **WhatsApp Account Management**: Connect multiple WhatsApp accounts simultaneously with QR code authentication
- **Campaign Management**: Create, edit, and manage marketing campaigns
- **Lead Management**: Import leads via CSV or add manually
- **Message Sequences**: Create multi-step message sequences with customizable delays
- **Scheduling**: Set specific days and times for sending messages
- **UniBox**: Unified inbox for all campaign conversations with AI-powered features

### AI-Powered Features (NEW)

- **Multi-Level Message Variation System**:
  - Level 1: Split long messages into multiple shorter messages
  - Level 2: Chunk each message into semantic segments
  - Level 3: Generate AI variations for each chunk (OpenAI GPT)
  - Level 4: Random assembly for unique combinations
  - Level 5: Human-like typing delays between messages

- **Intelligent Message Analysis**:
  - Auto-classification into 8 categories (OpenAI GPT)
  - Sentiment analysis (OpenAI GPT) - positive/negative/neutral
  - Visual indicators with tooltips for AI analysis results
  - Filter conversations by category and sentiment

- **AI Reply Suggestions**:
  - Context-aware reply generation (OpenAI GPT-4)
  - One-click sending of suggested replies
  - Category and sentiment-aware suggestions
  - Visual AI icons and indicators throughout the UI

## Tech Stack

- **Frontend**: React 18, Vite, Tailwind CSS, React Query, React Router
- **Backend**: Express.js, SQLite (sql.js), whatsapp-web.js
- **AI Service**: Python, FastAPI, OpenAI API
- **AI Models**: OpenAI GPT-3.5-turbo / GPT-4 (rewriting, classification, sentiment, reply generation)
- **Monorepo**: npm workspaces

## Project Structure

```
├── frontend/              # React frontend application
│   ├── src/
│   │   ├── components/    # Reusable UI components
│   │   ├── pages/         # Page components
│   │   ├── lib/           # API utilities
│   │   └── ...
│   └── ...
├── backend/               # Express API server
│   ├── src/
│   │   ├── database/      # SQLite schema and connection
│   │   ├── routes/        # API route handlers
│   │   ├── services/      # Business logic (WhatsApp manager)
│   │   └── index.js       # Server entry point
│   └── ...
└── package.json           # Root workspace configuration
```

## Getting Started

### Prerequisites

- Node.js 18+ 
- npm 9+
- Python 3.9+ (for AI service)

### Installation

1. Install Node.js dependencies:
```bash
npm run install:all
```

Or manually:
```bash
npm install
cd backend && npm install
cd ../frontend && npm install
```

2. Setup AI Service (Python):
```bash
cd ai_service
# Windows:
setup_ai_service.bat

# Or manually:
python -m venv venv
venv\Scripts\activate  # Windows
# source venv/bin/activate  # Linux/Mac
pip install -r requirements.txt
```

3. Configure OpenAI API Key:
```bash
# Copy the example env file
cp .env.example .env  # Linux/Mac
copy .env.example .env  # Windows

# Edit .env and add your OpenAI API key
OPENAI_API_KEY=sk-your-api-key-here
```

**Note**: You need an OpenAI API key from https://platform.openai.com/api-keys

### Development

**Option 1: Start all services with one command (Windows):**
```bash
start_services.bat
```

**Option 2: Start services separately:**

```bash
# Terminal 1 - AI Service (port 5000)
cd ai_service
venv\Scripts\activate
python main.py

# Terminal 2 - Backend (port 5177)
cd backend
npm run dev

# Terminal 3 - Frontend (port 5173)
cd frontend
npm run dev
```

### Production Build

```bash
npm run build
npm start
```

## AI Service Endpoints

The AI service runs on `http://localhost:5000` and provides:

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/rewrite/chunk-and-generate` | POST | Full pipeline: split → chunk → generate variations |
| `/api/rewrite/assemble` | POST | Random assembly from variations |
| `/api/classify` | POST | Classify message into 8 categories |
| `/api/sentiment` | POST | Analyze sentiment (positive/negative/neutral) |
| `/api/generate-reply` | POST | Generate reply suggestions |
| `/api/analyze` | POST | Combined classification + sentiment |
| `/api/typing-delay` | POST | Calculate human-like typing delay |
| `/api/metrics` | GET | Get service performance metrics |

## Running Evaluations

To evaluate AI model performance and generate metrics:

```bash
cd ai_service
venv\Scripts\activate
python evaluation/run_all_evaluations.py
```

Results will be saved to `ai_service/metrics/`.

## API Endpoints

### WhatsApp Accounts
- `GET /api/whatsapp-accounts` - List all accounts
- `POST /api/whatsapp-accounts` - Create new account
- `DELETE /api/whatsapp-accounts/:id` - Delete account
- `GET /api/whatsapp-accounts/:id/qr` - Get QR code for authentication

### Campaigns
- `GET /api/campaigns` - List all campaigns
- `POST /api/campaigns` - Create campaign
- `GET /api/campaigns/:id` - Get campaign details
- `PUT /api/campaigns/:id` - Update campaign
- `DELETE /api/campaigns/:id` - Delete campaign
- `POST /api/campaigns/:id/duplicate` - Duplicate campaign
- `POST /api/campaigns/:id/leads/upload` - Upload CSV leads
- `GET /api/campaigns/:id/report` - Generate report

### UniBox
- `GET /api/unibox/campaigns` - Get campaigns with message counts
- `GET /api/unibox/campaigns/:id/conversations` - Get conversations
- `GET /api/unibox/conversations/:id/messages` - Get message thread
- `POST /api/unibox/conversations/:id/send` - Send message

## License

MIT
