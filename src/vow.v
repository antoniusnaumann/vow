pub struct Observable[T] {
mut:
	value     T
	observers []Observer[T]
}

type Observer = fn (T)

pub fn state[T](value T) Observable[T] {
	return Observable[T]{
		value: value
	}
}

pub fn (self Observable[T]) get() T {
	return self.value
}

pub fn (mut self Observable[T]) set(value T) {
	for observer in self.observers {
		observer(value)
	}

	self.value = value
}

pub fn (mut self Observable[T]) observe(observer Observer[T]) {
	self.observers << observer
}
