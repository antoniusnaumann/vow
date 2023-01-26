import ui

pub fn label(mut text Observable[string]) &ui.Label {
	initial_text := text.get()

	mut label := ui.label(
		text: initial_text
	)

	text.observe(label.set_text)

	return label
}
