package main

import (
	"bufio"
	"fmt"
	"goalgo/lineareg"
	"os"
	"strconv"
	"strings"
)

func loadDataset(path string) ([][]float64, []float64) {
	fi, err := os.Open(path)

	if err != nil {
		panic(err)
	}

	defer func() {
		if err := fi.Close(); err != nil {
			panic(err)
		}
	}()

	X := [][]float64{}
	y := []float64{}

	scanner := bufio.NewScanner(fi)

	for scanner.Scan() {
		data := strings.Split(scanner.Text(), ",")

		inst := []float64{}

		inst = append(inst, 1) // theta_0 for x_0

		for i := 0; i < len(data)-1; i++ {
			fea, err := strconv.ParseFloat(data[i], 64)
			if err != nil {
				panic(err)
			}
			inst = append(inst, fea)
		}

		X = append(X, inst)

		label, err := strconv.ParseFloat(data[len(data)-1], 64)
		if err != nil {
			panic(err)
		}
		y = append(y, label)
	}

	return X, y
}

func main() {
	X, y := loadDataset("data/ex1data1.txt")

	fmt.Println(lineareg.LinearRegression(X, y))
}
