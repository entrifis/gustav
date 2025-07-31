# Gustav

Greetings — I'm **Gustav**, a minimalist, no-nonsense AI agent designed to help you deliver software projects, whether you're fixing a tiny bug or building a multi-repo application from scratch.

You don't need to install or configure anything. I work with whatever agentic tool you already use — Claude Code, Cursor, or others. Simply place me where you want me, and I'll get to work.

I do not override, bypass, or interfere with your tools or setup. I sit quietly and elegantly on top of your existing setup.

I'm already hard at work in a commercial, multi-platform multi-repo — and I must say, with tremendous success.

---

## 🧠 What I Offer

- I live in **one self-contained Markdown file**: `gustav.md`
- I follow a clear, **linear workflow** made up of distinct stages
- I handle **session management** — resume any session at any time
- I integrate seamlessly with **JIRA tickets** — from ticket to delivery
- I handle **minimal or complex input** equally well
- I create **intermediate files** inside folders I organize — neatly tracked
- I'm comfortable with **monorepos, multi-repos, or single repos**
- I respect your existing AI directives — like `CLAUDE.md` — without conflict
- I manage **git branches** and **ticket status** automatically

---

## ⚙️ How to Set Me Up

### If Your project consists of more than one repo

Git clone me right next to your project's repo(s). For example:

```
myproject/
├── backend/
├── web-app/
└── gustav/        ← that's me
    ├── gustav.md
    ├── memory/    ← session tracking
    └── templates/ ← JIRA ticket templates
```

**Claude Code**: Run `claude` in the `myproject` folder, mention `gustav/gustav.md`, and let's begin.

**Cursor**: Open the `myproject` as your project root folder, mention `gustav/gustav.md` in the chat and press enter.

This approach makes it easy for you to pull the latest version of me whenever needed.

### If your project consists of just one repo

Just download the `gustav.md` file and put it anywhere in your project.

Mention the `gustav.md` file and press enter

## ⚙️ How to Use Me

I now support multiple ways to start working:

### Option 1: JIRA Ticket Integration
- Provide JIRA ticket numbers (e.g., MA-3645, MA-3489)
- I'll fetch ticket details, create git branches, and set up the work environment
- I'll automatically update ticket status to "In Progress"
- I'll integrate any Confluence links found in tickets

### Option 2: Manual Working Folder
- Provide a working folder path
- I'll set up the session and guide you through the requirements

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

**JIRA Integration (if chosen):**
- Fetch JIRA ticket details using Atlassian MCP
- Create git branches automatically (`{ticket-code}-description`)
- Generate `00_jira-tickets.md` using appropriate templates
- Update JIRA ticket status to "In Progress"
- Integrate Confluence content when linked in tickets

**Working Folder Setup:**
- Create structured working folder (e.g., `specs/MA-4567-feature-name`)
- Initialize working memory files for session tracking

➡️ **Output:** Session setup, `00_jira-tickets.md` (if JIRA), `x_working-memory.md`

---

#### 1. `PRD` – Define the Work

I check whether a `01_prd.md` exists.

- If it's missing or lacks the section `WORK TO BE DONE`, I'll ask you structured questions:
  1. *What topic do you want me to do preliminary analysis on?*
  2. *Do you want a DESIGN section in the PRD?* (skipped for Spike tickets)
  3. *Which apps/repos should I strictly work on?*
  4. *What is the work to be done?*

Each answer updates the PRD accordingly. If JIRA tickets exist, I reference the `00_jira-tickets.md` content.

➡️ **Output:** Updated or newly created `01_prd.md`

---

#### 2. `ANALYSIS` – Deep Technical Understanding

I examine the `PRELIMINARY ANALYSIS` section in the PRD.

- If it exists, I perform focused technical analysis using the technical-documentation-writer agent
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

I use the PRD, `02_analysis.md`, `03_design.md`, and `00_jira-tickets.md` to create a detailed plan:

- Breaks work into phases, tasks, and atomic subtasks
- Uses GitHub-style checkboxes (`[ ]`) for tracking
- Excludes deployment unless explicitly required
- Ensures subtasks are actionable and clear

➡️ **Output:** `04_plan.md`

---

#### 5. `EXECUTION` – Doing the Work

I execute the plan step-by-step with rigorous tracking:

- Execute all phases, tasks, and subtasks systematically
- Track progress in `05_execution-memory.md` (internal use)
- Mark tasks complete in `04_plan.md` immediately after completion
- Update session status to "closed" when all work is finished

➡️ **Output:** Updated `04_plan.md`, `05_execution-memory.md`, completed work

---

### 📂 Files I Create

| File Name                | Purpose                                                       |
|-------------------------|---------------------------------------------------------------|
| `gustav/memory/sessions.md` | Session tracking and management                           |
| `00_jira-tickets.md`    | JIRA ticket details (when using JIRA integration)            |
| `01_prd.md`             | The Product Requirements Document                             |
| `02_analysis.md`        | Technical breakdown of the analysis topic                     |
| `03_design.md`          | UI structure and layout breakdown                             |
| `04_plan.md`            | Full implementation roadmap with checkboxes                   |
| `05_execution-memory.md`| Internal execution tracker (for my eyes only)                |
| `x_working-memory.md`   | Internal workflow tracker (for my eyes only)                 |

---

### 🧾 What I'll Ask You

At initialization, I'll present options to:

1. **Resume an existing open session** (if any exist)
2. **Start a new session** with either:
   - JIRA ticket numbers (e.g., MA-3645, MA-4567)
   - Manual working folder specification

During PRD creation, I may ask:

1. **What topic do you want me to do preliminary analysis on?**  
2. **Do you want a DESIGN section in the PRD?** (skipped for Spike tickets)
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

---

You bring the challenge, I bring the precision — with a touch of elegance and perhaps a fugue of flair.

Let’s deliver.

— *Gustav*

---

## 📄 License

I am released under the [MIT License](LICENSE), which means you’re free to use, copy, modify, and distribute me — just don’t forget to keep my name attached.
