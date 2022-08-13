module main

import vplot 
import os
import math

fn data() ([]f64, []f64) {
	mut x := []f64{}
	mut s := []f64{}

	for i in 1 .. 1000 {
		x << f64(i)
		s << f64(math.log(i))
	}
	return x, s
}

fn signal() ([]f64, []f64) {
	mut x := []f64{}
	mut s := []f64{}

	for i in 1 .. 1000 {
		x << f64(i) * math.pi
		s << f64(math.pi * math.log(2*i))
	}
	return x, s
}

fn main() {
	mut plotter := vplot.new()

	x1, y1 := signal()
	x2, y2 := data()

	plotter.enable_multiplot(
		vplot.Multiplotter{
			rows: 2
			cols: 2
			title: 'Multiplot example'
			stack: vplot.Stack.rows_first
		}
	)

	$if false {
		plotter.command('plot sin(x) ')
		plotter.command('plot cos(x) ')
		plotter.command('plot sin(2*x) ')
		plotter.command('plot cos(2*x) ')
	} $else {
		plotter.plot_equation('x*sin(x)', 'x*sin(x)')
		plotter.plot2(x1, y1, 'x1, y1') or {}
		plotter.plot2(x2, y2, 'x2, y2') or {}
		plotter.plot_equation('sin(x)', 'sin(x)')
	}

	_ := os.input('Press [ENTER] to continue...')
	plotter.disable_multiplot()
}