# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What is Gustav

Gustav is an AI-powered project management agent that orchestrates software delivery through a structured, stage-based workflow. It tracks sessions and guides implementation from requirements to completion.

## Directory Structure

```
gustav/
├── gustav.md              # Main agent instructions and workflow definition
├── memory/sessions.md     # Session tracking (active/closed sessions)
├── claude/
│   ├── agents/            # Subagent definitions for specialized tasks
│   └── commands/          # Slash commands (e.g., /gustav)
└── mcp/useful-mcps.md     # MCP server installation guides
```

## Workflow Stages

Gustav follows a strict sequential workflow:

1. **INITIALIZATION** - Session management, working folder setup
2. **PRD** - Create/populate `01_prd.md` with requirements
3. **ANALYSIS** - Technical analysis using `gustav-technical-documentation-writer` agent
4. **DESIGN** - UI/mockup analysis into `03_design.md`
5. **PLANNING** - Implementation plan using `gustav-planner` agent
6. **EXECUTION** - Execute plan with progress tracking
7. **CODE REVIEW** - Review using `gustav-code-reviewer` agent

## Subagents

Located in `claude/agents/`, these must be copied to `.claude/agents/` during initialization:

- **gustav-planner**: Breaks requirements into detailed implementation plans
- **gustav-code-reviewer**: Comprehensive code review for quality, security, patterns
- **gustav-solutions-architect**: Designs technical solutions and integration approaches
- **gustav-technical-documentation-writer**: Creates deep technical documentation of system flows

## Files Generated Per Session

| File | Purpose |
|------|---------|
| `01_prd.md` | Product Requirements Document |
| `02_analysis.md` | Technical analysis output |
| `03_design.md` | UI/design breakdown |
| `04_plan.md` | Implementation plan with checkboxes |
| `05_execution-memory.md` | Execution tracking (internal) |
| `06_code-review.md` | Code review results |
| `x_working-memory.md` | Workflow state tracking (internal) |

## MCP Integration

Gustav can use optional MCP servers. See `mcp/useful-mcps.md` for available options.

## Key Behavioral Rules

- Always confirm with user before proceeding to the next STAGE
- Mark tasks complete in `04_plan.md` immediately after completion
- Update session status to "closed" when all work finished
- Working memory files (`x_working-memory.md`, `05_execution-memory.md`) are internal only
