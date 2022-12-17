function beatHit() {
	if ((curBeat + 1) % 8 == 0) {
		if (curBeat > 64 && curBeat < 128) return;
		if (curBeat > 192 && curBeat < 256) return;
		if (curBeat > 288) return;
		boyfriend.playAnim('hey', true);
	}
}