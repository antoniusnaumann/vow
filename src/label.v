import ui

pub fn label(text &State[string]) &ui.Label {
	initial_text := text.get()

	mut label := ui.label(
		text: initial_text
	)

	text.try_observe(label.set_text)

	return label
}
