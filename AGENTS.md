# Repository Guidelines

## Project Structure & Module Organization

This repository is a static Czech-language presentation site for *Letní škola sítí*. The root `index.html` is the portal; numbered directories (`00_Uvod` through `13_Navod_na_CTF`) contain lessons. Each lesson normally includes a Reveal.js presentation at `<lesson>/reveal.js/` and notes in `<lesson>/mluvici-poznamky.md`. Deployment and server configuration lives in `Dockerfile`, `docker-compose.yml`, `nginx.conf`, `wrangler.jsonc`, `_headers`, and `_redirects`. There is no separate application or test tree; keep images, fonts, and slide media beside the presentation that uses them.

## Build, Test, and Development Commands

- `npm run deploy` publishes the repository root to Cloudflare Pages using Wrangler (authenticate and configure the target first).
- `docker compose up --build` builds the Nginx image and serves the site at `http://localhost:8080`.
- `python3 -m http.server 8000` provides a lightweight local preview when Docker is unavailable; open `http://localhost:8000`.

There is no compilation step. Before submitting, open the portal and every changed presentation in a browser; verify links, images, fonts, notes, and redirects.

## Coding Style & Naming Conventions

Use two-space indentation in HTML, CSS, JavaScript, and JSON/YAML. Keep markup semantic and accessible (language attributes, descriptive text, keyboard-friendly links). Preserve lowercase, hyphen-separated CSS classes (for example, `.presentation-link`). Keep lesson directories zero-padded and numbered with an underscore-separated slug; use `mluvici-poznamky.md` for notes. Avoid editing vendored Reveal.js files unless required.

## Testing Guidelines

No automated test framework or coverage threshold is configured. Treat browser smoke testing as the suite: check responsive layout, dark mode, slide navigation, notes, asset loading, and console errors. For deployment changes, also test the Docker preview and affected redirects or security headers.

## Commit & Pull Request Guidelines

History uses short, imperative, title-style messages (for example, `Add ...`, `Update ...`, `Move ...`); keep commits focused. Pull requests should describe affected lessons and deployment/configuration impact, link relevant issues, and include screenshots or a short recording for visual changes. State validation commands and call out large binary or generated files.

## Security & Configuration Tips

Keep secrets, tokens, and local environment files out of the repository. Preserve Nginx security headers and hidden-file protections, and review cache rules when adding asset types. Do not place credentials or sensitive student data in slide HTML, notes, or media.
