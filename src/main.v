import ui

[heap]
struct App {
mut:
	window &ui.Window = unsafe { nil }

	log      string
	todos    State[string] = Observable[string]{}
	title    string
	new_todo string
}

fn main() {
	mut app := &App{}

	app.title = 'Todo List App in V'

	input := ui.textbox(
		max_len: 50
		width: 200
		placeholder: 'New Todo...'
		text: &app.new_todo
	)

	app.window = ui.window(
		width: 600
		height: 400
		title: 'V UI Demo'
		children: [
			ui.row(
				children: [
					ui.column(
						margin: ui.Margin{10, 10, 10, 10}
						width: 200
						spacing: 13
						children: [
							label(text: &app.title),
							ui.row(
								children: [
									input,
									ui.button(
										text: '+'
										on_click: app.add_todo
									),
								]
							),
							label(text: &app.todos),
						]
					),
				]
			),
		]
	)

	ui.run(app.window)
}

fn (mut app App) add_todo(button &ui.Button) {
	app.todos.try_set(app.todos.get() + '\n' + app.new_todo)
}
