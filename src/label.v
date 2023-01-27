import ui

// TODO: All params that should allow reacting to change should be State[T]
[params]
pub struct LabelParams {
	id      string
	width   int
	height  int
	z_index int
	text    &State[string]
}

pub fn label(params LabelParams) &ui.Label {
	initial_text := params.text.get()

	mut label := ui.label(
		id: params.id
		width: params.width
		height: params.height
		z_index: params.z_index
		text: initial_text
	)

	params.text.try_observe(label.set_text)

	return label
}
