package lineareg

import (
	"goalgo/utils"
)

func cost(X [][]float64, y []float64, theta []float64) float64 {
	var J float64
	num := len(X)
	for i := 0; i < num; i++ {
		diff := utils.MultiplyVectors(X[i], theta) - y[i]
		J = J + diff*diff
	}
	return J / (float64(num) * 2)
}

func gradDecent(X [][]float64, y []float64, iterations int, alpha float64) []float64 {
	theta := []float64{0.0, 0.0}
	num := len(X)
	feanum := len(X[0])

	for iter := 0; iter < iterations; iter++ {

		theta_update := []float64{0.0, 0.0}

		for i := 0; i < num; i++ {
			diff := utils.MultiplyVectors(X[i], theta) - y[i]
			for f := 0; f < feanum; f++ {
				theta_update[f] = theta_update[f] + diff*X[i][f]
			}
		}

		for f := 0; f < feanum; f++ {
			theta[f] = theta[f] - alpha*theta_update[f]/float64(num)
		}

		//fmt.Printf("iteration %d: cost=%f\n", iter, cost(X, y, theta))

	}

	return theta
}

func LinearRegression(X [][]float64, y []float64) []float64 {
	iterations := 1500
	alpha := 0.01
	theta := gradDecent(X, y, iterations, alpha)

	return theta
}
