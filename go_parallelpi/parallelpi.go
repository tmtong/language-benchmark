package main

import (
	"fmt"

	"github.com/exascience/pargo/parallel"
)

func single() {
	var start int = 0
	var end int = 100
	var accum float64 = 0

	var sign float64 = -1
	if start%2 == 0 {
		sign = 1
	}
	var denominator float64
	for i := start; i < end; i++ {
		denominator = float64(i*2 + 1.0)
		accum = accum + float64(1.0/denominator*sign)
		sign = sign * -1
	}

	var pi float64 = accum * 4
	fmt.Printf("Prime number is %f", pi)

}
func multi() float64 {
	var accum float64 = 0
	var start int = 0
	var end int = 1000000000
	var numprocessor int = 8

	accum = parallel.RangeReduceFloat64(
		start, end, numprocessor,
		func(start, high int) float64 {
			var sign float64 = -1
			var accum float64 = 0
			if start%2 == 0 {
				sign = 1
			}
			var denominator float64
			for i := start; i < end; i++ {
				denominator = float64(i*2 + 1.0)
				accum = accum + float64(1.0/denominator*sign)
				sign = sign * -1
			}
			return accum
		},
		func(left, right float64) float64 {
			return left + right
		},
	)

	var pi float64 = accum * 4
	fmt.Printf("Prime number is %f", pi)
	return accum
}

func main() {
	// single()
	multi()
}
