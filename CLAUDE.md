# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Structure

This is a dual-architecture project consisting of:

1. **UIApp** - React/TypeScript weather application using Vite
2. **BMAD Core** - Business, Marketing, and Development agent system with structured workflow documentation

### UIApp (Frontend Application)
- **Location**: `UIApp/`
- **Tech Stack**: React 19, TypeScript, Vite, Tailwind CSS 4, Jest
- **Architecture**: Component-based React app with utilities, services, and configuration layers
- **Main Components**: Weather display functionality with geolocation integration

### BMAD System 
- **Location**: `.bmad-core/`
- **Purpose**: AI-driven planning and development methodology with agent workflows
- **Configuration**: `core-config.yaml` defines document locations and settings
- **Agents**: Analyst, Architect, Developer, PM, PO, QA, SM, UX Expert roles
- **Prefix**: Commands use "BMad" prefix as defined in core-config.yaml

## Common Commands

### UIApp Development
```bash
cd UIApp
npm install          # Install dependencies
npm run dev          # Start development server
npm run build        # Build for production (runs TypeScript check + Vite build)
npm test             # Run Jest tests
npm test:watch       # Run tests in watch mode
npm run preview      # Preview production build
```

### Testing
- **Framework**: Jest with jsdom environment
- **Location**: Tests are co-located in `__tests__/` directories
- **Command**: `npm test` (from UIApp directory)
- **Watch Mode**: `npm test:watch`

## Architecture Patterns

### UIApp Structure
- `src/components/` - React components
- `src/services/` - API and external service integrations  
- `src/utils/` - Pure utility functions with retry logic and geolocation handling
- `src/config/` - Environment and configuration management
- `src/types/` - TypeScript type definitions
- `src/hooks/` - Custom React hooks

### BMAD Workflow Integration
The project follows BMAD methodology with:
- Structured documentation in `docs/` (referenced by core-config.yaml)
- Agent-driven development workflow
- PRD/Architecture/QA document sharding for large projects
- Debug logging to `.ai/debug-log.md`

### Key Configuration Files
- `UIApp/package.json` - Dependencies and scripts
- `UIApp/vite.config.ts` - Vite bundler configuration  
- `UIApp/tailwind.config.js` - Tailwind CSS configuration
- `UIApp/tsconfig.json` - TypeScript configuration
- `.bmad-core/core-config.yaml` - BMAD system configuration

## Environment Setup
- Environment variables in `UIApp/.env` (template in `.env.example`)
- TypeScript strict mode enabled
- Tailwind CSS 4.x for styling
- Jest with React Testing Library for testing

## BMAD Agent System

The BMAD (Business, Marketing, and Development) system provides structured AI-driven development workflows through specialized agents.

### Available Agents

#### `/BMad-analyst` - Business Analyst Agent
- **Role**: Requirements gathering, business logic analysis, and stakeholder communication
- **Responsibilities**: PRD creation, user story definition, business requirement validation
- **Documents**: Works with `docs/prd.md` and `docs/prd/` sharded documents

#### `/BMad-architect` - System Architect Agent  
- **Role**: Technical architecture design and system planning
- **Responsibilities**: Architecture documentation, technical decisions, system design
- **Documents**: Works with `docs/architecture.md` and `docs/architecture/` sharded documents

#### `/BMad-developer` - Developer Agent
- **Role**: Code implementation and technical development
- **Responsibilities**: Feature implementation, code reviews, technical debt resolution
- **Always Loads**: 
  - `docs/architecture/coding-standards.md`
  - `docs/architecture/tech-stack.md`
  - `docs/architecture/source-tree.md`

#### `/BMad-pm` - Project Manager Agent
- **Role**: Project coordination and timeline management
- **Responsibilities**: Sprint planning, resource allocation, progress tracking

#### `/BMad-po` - Product Owner Agent
- **Role**: Product strategy and feature prioritization
- **Responsibilities**: Backlog management, feature definition, acceptance criteria

#### `/BMad-qa` - Quality Assurance Agent
- **Role**: Testing strategy and quality validation
- **Responsibilities**: Test planning, quality metrics, bug tracking
- **Documents**: Works with `docs/qa/` directory

#### `/BMad-sm` - Scrum Master Agent
- **Role**: Process facilitation and team coordination
- **Responsibilities**: Sprint facilitation, impediment removal, process improvement

#### `/BMad-ux` - UX Expert Agent
- **Role**: User experience design and usability
- **Responsibilities**: UI/UX design, user research, interaction design

### BMAD Configuration
- **Prefix**: All commands use `BMad` prefix
- **Debug Logging**: `.ai/debug-log.md`
- **Story Location**: `docs/stories/`
- **PRD Sharding**: Enabled with pattern `epic-{n}*.md`
- **Architecture Sharding**: Enabled for large system documentation