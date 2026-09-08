/**
 * Syncs pi theme with macOS system appearance (dark/light mode).
 *
 * Dark  -> rose-pine
 * Light -> rose-pine-dawn
 *
 * Installed globally: loaded automatically for every pi session.
 * Themes live in ~/.pi/agent/themes/{rose-pine,rose-pine-dawn}.json
 */

import { exec } from "node:child_process";
import { promisify } from "node:util";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const execAsync = promisify(exec);

const DARK_THEME = "rose-pine";
const LIGHT_THEME = "rose-pine-dawn";
const POLL_MS = 2000;

async function isDarkMode(): Promise<boolean> {
	try {
		const { stdout } = await execAsync(
			"osascript -e 'tell application \"System Events\" to tell appearance preferences to return dark mode'",
		);
		return stdout.trim() === "true";
	} catch {
		return false;
	}
}

async function currentTheme(): Promise<string> {
	return (await isDarkMode()) ? DARK_THEME : LIGHT_THEME;
}

export default function (pi: ExtensionAPI) {
	if (process.platform !== "darwin") return;

	let intervalId: ReturnType<typeof setInterval> | null = null;

	pi.on("session_start", async (_event, ctx) => {
		let active = await currentTheme();
		ctx.ui.setTheme(active);

		intervalId = setInterval(async () => {
			const next = await currentTheme();
			if (next !== active) {
				active = next;
				ctx.ui.setTheme(active);
			}
		}, POLL_MS);
	});

	pi.on("session_shutdown", () => {
		if (intervalId) {
			clearInterval(intervalId);
			intervalId = null;
		}
	});
}
