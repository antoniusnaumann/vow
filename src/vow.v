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

pub fn (self &Observable[T]) observe(observer Observer[T]) {
	unsafe { self.observers << observer }
}

type State[T] = Observable[T] | T

pub fn (self State[T]) get[T]() T {
	return match self {
		T { self }
		Observable[T] { self.get() }
	}
}

pub fn (self &State[T]) try_observe[T](observer Observer[T]) {
	match self {
		T {}
		Observable[T] { self.observe(observer) }
	}
}

pub fn (mut self State[T]) try_set[T](value T) {
	match mut self {
		T {}
		Observable[T] { self.set(value) }
	}
}
