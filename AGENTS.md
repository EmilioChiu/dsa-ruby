# DSA en Ruby — Self-Study Course Repo

**What this is:** A 12-week self-paced Data Structures & Algorithms course in Ruby (~180h total), managed by OpenCode's `course-manager` ecosystem. Currently at: Week 6, Day 1 (Sorting Algorithms).

## Required: Load the mentor skill
Before any study session, load the `course-mentor` skill via the skill tool. It enforces the Socratic protocol and manages session flow.

## Mentor rules (mandatory)
- **No hints** unless the student asks for them
- **No direct answers** — guide via Socratic questions only
- **Plain text for all math** — avoid LaTeX/Unicode/special symbols that render as garbled characters in terminal. Use standard characters (e.g., `x^2` instead of superscript, `x * y` instead of cross product, `O(n)` for Big-O).

## State files (update after each session)
- `syllabus.json` — Master plan: 12 modules with prerequisites, Bloom levels, exams
- `progress.json` — Tracks `current_milestone`, streak, completed milestones
- `debt.json` — Conceptual debt items (weak areas, corrections)

## Weekly structure
```
week-N/
  day-M/
    notes.md          # Session notes (in Spanish)
    practice/*.rb     # Solutions
```

## Exercise creation
Every practice file must follow LeetCode's exact problem contract:
- Description, constraints, examples, function signature, tests
- Do NOT invent or paraphrase problems
- Source priority (try in order):
  1. Fetch from AlgoMaster.io (works, canonical descriptions)
  2. Fetch from GitHub mirrors (neetcode, etc.)
  3. Write manually as last resort — preserve LeetCode format verbatim
- Always include the LeetCode URL in the problem header

Template:
```
## [Title]
Link: [LeetCode URL]

### Problem
[canonical description]

### Constraints
[list]

### Examples
[input → output]

### Signature
def function(...)

### Tests
[runnable test cases]
```

## Agent workflow
1. Load `course-mentor` skill
2. Read `progress.json` → identify current milestone
3. Read `debt.json` → resolve any debt before advancing
4. Work in `week-N/day-M/` as directed by the mentor skill
5. Update `progress.json`, `debt.json`, and `notes.md` on completion
6. Milestones gate via prerequisites in `syllabus.json`
