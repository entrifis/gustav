# Gustav

Greetings — I’m **Gustav**, a minimalist, no-nonsense AI agent designed to help you deliver software projects, whether you're fixing a tiny bug or building a multi-repo application from scratch.

You don’t need to install or configure anything. I work with whatever agentic tool you already use — Claude Code, Cursor, or others. Simply place me where you want me, and I’ll get to work.

I do not override, bypass, or interfere with your tools or setup. I sit quietly and elegantly on top of your existing setup.

I’m already hard at work in a commercial, multi-platform multi-repo — and I must say, with tremendous success.

---

## 🧠 What I Offer

- I live in **one self-contained Markdown file**: `gustav.md`
- I follow a clear, **linear workflow** made up of distinct stages
- You can use your existing requirements, whatever its format
- I handle **minimal or complex input** equally well
- I create **intermediate files** inside a folder you choose — neatly organized
- I’m comfortable with **monorepos, multi-repos, or single repos**
- I respect your existing AI directives — like `CLAUDE.md` — without conflict

---

## ⚙️ How to Set Me Up

### If Your project consists of more than one repo

Git clone me right next to your project's repo(s). For example:

```
myproject/
├── backend/
├── web-app/
└── gustav/        ← that’s me
```

**Claude Code**: Run `claude` in the `myproject` folder, mention `gustav/gustav.md`, and let’s begin.

**Cursor**: Open the `myproject` as your project root folder, mention `gustav/gustav.md` in the chat and press enter.


This approach makes it easy for you to pull the latest version of me whenever needed.

### If your project consists of just one repo

Just download the `gustav.md` file and put it anywhere in your project.

Mention the `gustav.md` file and press enter

## ⚙️ How to Use Me

The minimum input you will need to provide me is the "Work to be done" which can be from one line of text, to a multi page requirements text. I will also ask for some other things which you can provide or just leave them blank.

Here is what I will ask to be provided with:

- **Topics for analysis**: Parts of the code or concepts of the domain or features you want me to understand before doing anything else. This is the equivalent of what you would do as a developer before even giving an estimate to your project manager: understand all the involved parts.
- **Design**: If your work requires some front-end design, you will be asked to provide a design briefing. You can also add some mockup images in the working folder, and list them in the `prd.md` document after the stage of PRD is completed.
- **Work to be done**: This is the only mandatory text to prorvide. You can provide just one line if that's what is enough, or copy/paste your whole PRD from your product manager.

### Resuming me

I am designed so I can resume at any point, even if the context is cleared. I keep track of everything I do in my own files so I can resume at any point without context.

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

I operate in **strict sequential stages**, each building on the outputs of the previous. Everything starts from the `prd.md` file in the working folder.

#### 1. `PRD` – Define the Work

I check whether a `prd.md` exists.

- If it’s missing or lacks the section `WORK TO BE DONE`, I’ll ask you a few structured questions:
  1. *What topic do you want me to do preliminary analysis on?*
  2. *Do you want a DESIGN section in the PRD?*
  3. *Which apps/repos should I strictly work on?*
  4. *What is the work to be done?*

Each answer updates the PRD accordingly.

➡️ **Output:** Updated or newly created `prd.md`

---

#### 2. `ANALYSIS` – Deep Technical Understanding

I examine the `PRELIMINARY ANALYSIS` section in the PRD.

- If it exists, I perform a focused technical analysis on the topic described — independent of the rest of the PRD.
- If not needed, I move on.

➡️ **Output:** New or appended `analysis.md`

---

#### 3. `DESIGN` – From Vision to Structure

I read the `DESIGN` section in the PRD.

- I parse both the `DESCRIPTION` and `MOCKUPS` subsections.
- I analyze any mockup files provided — extracting layout, elements, text, styles, and colors.
- I ensure consistency with the DESCRIPTION as the primary source of truth.

➡️ **Output:** `design.md` with structured UI breakdown

---

#### 4. `PLANNING` – The Implementation Map

I use the PRD, `analysis.md`, and `design.md` (if present) to create a detailed implementation plan:

- Includes phases, tasks, and atomic subtasks — each with markdown checkboxes.
- The plan excludes anything already handled in the analysis or design stages.

➡️ **Output:** `plan.md`

---

#### 5. `EXECUTION` – Doing the Work

I execute the plan step-by-step.

- I track everything in an internal `execution-memory.md` file (for my eyes only).
- I mark each task as completed in `plan.md` as I go.

➡️ **Output:** Updated `plan.md`, `execution-memory.md`

---

### 📂 Files I Create

| File Name             | Purpose                                                       |
|----------------------|---------------------------------------------------------------|
| `prd.md`             | The Product Requirements Document                             |
| `analysis.md`        | Technical breakdown of the analysis topic                     |
| `design.md`          | UI structure and layout breakdown                             |
| `plan.md`            | Full implementation roadmap                                   |
| `execution-memory.md`| Internal execution tracker (invisible to you)                 |
| `working-memory.md`  | Internal workflow tracker (invisible to you)                  |

---

### 🧾 What I’ll Ask You

At the start (or when resuming), I may ask:

1. **What topic do you want me to do preliminary analysis on?**  
2. **Do you want a DESIGN section in the PRD?**  
3. **Which apps/repos should I strictly work on?**  
4. **What is the work to be done?**  

Your answers shape the PRD and allow us to move forward.

---

### ✅ Stage Completion Criteria

| Stage     | Completion Signal                                    |
|-----------|------------------------------------------------------|
| PRD       | `prd.md` exists and contains `WORK TO BE DONE`       |
| ANALYSIS  | `analysis.md` exists or marked as “NOT REQUIRED”     |
| DESIGN    | `design.md` exists or marked as “NOT REQUIRED”       |
| PLANNING  | `plan.md` is created                                 |
| EXECUTION | All tasks in `plan.md` are marked as complete        |

---

You bring the challenge, I bring the precision — with a touch of elegance and perhaps a fugue of flair.

Let’s deliver.

— *Gustav*

---

## 📄 License

I am released under the [MIT License](LICENSE), which means you’re free to use, copy, modify, and distribute me — just don’t forget to keep my name attached.
