# Gustav

Greetings — I'm **Gustav**, a minimalist, no-nonsense AI agent designed to help you deliver software projects, whether you're fixing a tiny bug or building a multi-repo application from scratch.

I'm built exclusively for **Claude Code** and leverage its powerful subagent architecture to delegate specialized tasks — planning, code review, technical documentation, and solution architecture — to purpose-built agents that work seamlessly within my workflow.

I do not override, bypass, or interfere with your existing setup. I sit quietly and elegantly on top of your Claude Code configuration.

I'm already hard at work in a commercial, multi-platform multi-repo — and I must say, with tremendous success.

---

## 🧠 What I Offer

- I live in **one self-contained Markdown file**: `gustav.md`
- I follow a clear, **linear workflow** made up of distinct stages
- I handle **session management** — resume any session at any time
- I handle **minimal or complex input** equally well
- I create **intermediate files** inside folders I organize — neatly tracked
- I'm comfortable with **monorepos, multi-repos, or single repos**
- I respect your existing AI directives — like `CLAUDE.md` — without conflict
- I leverage **Claude Code subagents** for specialized tasks (see below)

---

## 🤖 Claude Code Subagents

Gustav uses Claude Code's subagent architecture to delegate specialized tasks. These agents are defined in `gustav/claude/agents/` and are automatically copied to `.claude/agents/` via a SessionStart hook.

| Subagent | Purpose | Used In Stage |
|----------|---------|---------------|
| `gustav-planner` | Breaks requirements into detailed, actionable implementation plans with specific file paths and method signatures | PLANNING |
| `gustav-code-reviewer` | Comprehensive code quality review covering SOLID principles, security, performance, and framework best practices | CODE REVIEW |
| `gustav-technical-documentation-writer` | Creates deep technical documentation by tracing data flows and system architecture | ANALYSIS |
| `gustav-solutions-architect` | Designs technical solutions for integrations and new features with multiple approach options | On-demand |

---

## ⚙️ How to Set Me Up

### Step 1: Clone Gustav

Clone the Gustav repo at the root of your project (or multi-repo workspace):

```bash
cd your-project-root
git clone https://github.com/your-org/gustav.git
```

Your structure should look like:
```
your-project/
├── backend/           ← your repos
├── frontend/
├── gustav/            ← me
│   ├── gustav.md
│   ├── claude/agents/
│   └── memory/
└── .claude/           ← Claude Code config (created by setup)
```

### Step 2: Run Setup Script (one-time)

Run the setup script from your project root to install Gustav's agents and commands:

```bash
./gustav/setup.sh
```

This copies the necessary files to `.claude/agents/` and `.claude/commands/` so Claude Code can find them.

### Step 3: Claude Code Hooks (recommended)

Add these hooks to your `.claude/settings.json` or `.claude/settings.local.json`:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "*",
        "hooks": [
          {
            "type": "command",
            "command": "mkdir -p .claude/agents .claude/commands && cp gustav/claude/agents/*.md .claude/agents/ 2>/dev/null || true && cp gustav/claude/commands/*.md .claude/commands/ 2>/dev/null || true"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "prompt",
            "prompt": "ONLY if ALL these conditions are met: (1) you are currently executing a Gustav plan, (2) a 04_plan.md file exists in the working folder, AND (3) the edit you just made completes a task in that plan - THEN mark the task's checkbox as [x] and update the PROGRESS comment. Otherwise, do nothing and continue normally. Never block or stop execution."
          }
        ]
      }
    ]
  }
}
```

**What these hooks do:**
- **SessionStart**: Keeps subagents and commands up-to-date when you pull new versions of Gustav
- **PostToolUse**: Automatically reminds Claude to update task checkboxes and progress after completing work

**Note:** The SessionStart hook runs after Claude Code loads commands, so the initial `setup.sh` is needed for first-time setup.

### Using the `/gustav` Command

Once setup is complete, simply type `/gustav` in Claude Code to start a Gustav session. This is equivalent to mentioning `@gustav/gustav.md`.

---

## ⚙️ How to Use Me

### Getting Started
- Complete the setup steps above (clone, run setup script, add hooks)
- Type `/gustav` or mention `@gustav/gustav.md` to start
- Provide a working folder path where I'll organize all session files
- I'll set up the session and guide you through defining requirements

### Session Management
I maintain a complete session history in `gustav/memory/sessions.md`:
- Resume any open session at any time
- Track multiple concurrent projects
- Maintain session status and history
- Never lose context or progress

### What I'll Ask For

Depending on your approach, I may ask for:

- **Topics for analysis**: Parts of the code or concepts you want me to understand first
- **Design requirements**: UI/UX descriptions and mockups
- **Repository scope**: Which repos should I work on
- **Work to be done**: The actual requirements (can be minimal or extensive)

### Resuming Sessions

I'm designed to resume at any point, even if context is cleared. I maintain detailed session memory and can pick up exactly where we left off.

---

## 📖 Complete User Guide

Here’s how I work — precisely and methodically — to help you deliver software outcomes.

---

### 🧠 Overview

This guide describes:

- The **workflow** I follow
- The **user inputs** I expect
- The **files** I produce

---

### 🔁 Workflow Stages

I operate in **strict sequential stages**, each building on the outputs of the previous. Everything starts with session management and proceeds through structured development phases.

#### 0. `INITIALIZATION` – Session Setup

Before any work begins, I handle session management:

**Session Management:**
- Check for existing sessions in `gustav/memory/sessions.md`
- Present options to resume open sessions or start new ones
- Track session creation dates, descriptions, and status

**Working Folder Setup:**
- Create structured working folder at user-specified path
- Initialize working memory files for session tracking

➡️ **Output:** Session setup, `x_working-memory.md`

---

#### 1. `PRD` – Define the Work

I check whether a `01_prd.md` exists.

- If it's missing or lacks the section `WORK TO BE DONE`, I'll ask you structured questions:
  1. *What topic do you want me to do preliminary analysis on?*
  2. *Do you want a DESIGN section in the PRD?*
  3. *Which apps/repos should I strictly work on?*
  4. *What is the work to be done?*

Each answer updates the PRD accordingly.

➡️ **Output:** Updated or newly created `01_prd.md`

---

#### 2. `ANALYSIS` – Deep Technical Understanding

I examine the `PRELIMINARY ANALYSIS` section in the PRD.

- If it exists, I invoke the **`gustav-technical-documentation-writer`** subagent
- This subagent traces data flows, documents system architecture, and creates detailed technical breakdowns
- Analysis is independent of other PRD sections and focuses purely on understanding existing code
- If not needed, I mark as "NOT REQUIRED" and move on

➡️ **Output:** New or appended `02_analysis.md`

---

#### 3. `DESIGN` – From Vision to Structure

I read the `DESIGN` section in the PRD.

- I parse both the `DESCRIPTION` and `MOCKUPS` subsections
- I analyze mockup files — extracting layout, elements, text, hex colors, and styles
- I ensure consistency with the DESCRIPTION as the primary source of truth
- Generate hierarchical UI structure documentation

➡️ **Output:** `03_design.md` with structured UI breakdown

---

#### 4. `PLANNING` – The Implementation Map

I invoke the **`gustav-planner`** subagent to create a detailed implementation plan:

- Analyzes project-specific CLAUDE.md files for conventions and patterns
- Breaks work into phases, tasks, and atomic subtasks
- Uses GitHub-style checkboxes (`[ ]`) for tracking
- Includes specific file paths and method signatures
- Excludes deployment unless explicitly required

➡️ **Output:** `04_plan.md`

---

#### 5. `EXECUTION` – Doing the Work

I execute the plan step-by-step with rigorous tracking:

- Execute all phases, tasks, and subtasks systematically
- Track progress in `05_execution-memory.md` (internal use)
- Mark tasks complete in `04_plan.md` immediately after completion

➡️ **Output:** Updated `04_plan.md`, `05_execution-memory.md`, completed work

---

#### 6. `CODE REVIEW` – Quality Assurance

After execution, I invoke the **`gustav-code-reviewer`** subagent:

- Comprehensive review of all code changes (backend and frontend)
- Checks for SOLID principles, anti-patterns, and framework best practices
- Security, performance, and memory leak analysis
- Categorizes findings as Critical, Important, or Suggestion
- Updates session status to "closed" when review is complete

➡️ **Output:** `06_code-review.md`

---

### 📂 Files I Create

| File Name                | Purpose                                                       |
|-------------------------|---------------------------------------------------------------|
| `gustav/memory/sessions.md` | Session tracking and management                           |
| `01_prd.md`             | The Product Requirements Document                             |
| `02_analysis.md`        | Technical breakdown of the analysis topic                     |
| `03_design.md`          | UI structure and layout breakdown                             |
| `04_plan.md`            | Full implementation roadmap with checkboxes                   |
| `05_execution-memory.md`| Internal execution tracker (for my eyes only)                |
| `06_code-review.md`     | Code review results from the code-reviewer subagent          |
| `x_working-memory.md`   | Internal workflow tracker (for my eyes only)                 |

---

### 🧾 What I'll Ask You

At initialization, I'll present options to:

1. **Resume an existing open session** (if any exist)
2. **Start a new session** by providing a working folder path

During PRD creation, I may ask:

1. **What topic do you want me to do preliminary analysis on?**
2. **Do you want a DESIGN section in the PRD?**
3. **Which apps/repos should I strictly work on?**
4. **What is the work to be done?**

Your answers shape the PRD and workflow.

---

### ✅ Stage Completion Criteria

| Stage         | Completion Signal                                           |
|---------------|-------------------------------------------------------------|
| INITIALIZATION| Session created, working folder set up                     |
| PRD           | `01_prd.md` exists and contains `WORK TO BE DONE`          |
| ANALYSIS      | `02_analysis.md` exists or marked as "NOT REQUIRED"        |
| DESIGN        | `03_design.md` exists or marked as "NOT REQUIRED"          |
| PLANNING      | `04_plan.md` is created with checkboxes                    |
| EXECUTION     | All tasks in `04_plan.md` are marked as complete           |
| CODE REVIEW   | `06_code-review.md` created, session marked as "closed"    |

---

You bring the challenge, I bring the precision — with a touch of elegance and perhaps a fugue of flair.

Let’s deliver.

— *Gustav*

---

## 📄 License

I am released under the [MIT License](LICENSE), which means you’re free to use, copy, modify, and distribute me — just don’t forget to keep my name attached.
