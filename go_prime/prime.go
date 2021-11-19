package main

import (
	"fmt"
)

func main() {
	targetPrime := 10000
	currentNum := 2
	currentDenominator := currentNum - 1
	for true {
		if currentDenominator == 1 {

			if targetPrime == 0 {
				fmt.Println("Prime numbers is", currentNum)
				break
			}
			targetPrime = targetPrime - 1
			currentNum = currentNum + 1
			currentDenominator = currentNum - 1
		}
		if currentNum%currentDenominator != 0 {
			currentDenominator = currentDenominator - 1
			continue
			// not divisible, keep going
		}
		if currentNum%currentDenominator == 0 {
			// divisible, this is definitely not prime
			currentNum = currentNum + 1
			currentDenominator = currentNum - 1
			continue
		}
	}
}
