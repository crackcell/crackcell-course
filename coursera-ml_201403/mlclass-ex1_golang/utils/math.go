package utils

func MultiplyVectors(vec1 []float64, vec2 []float64) float64 {
	if len(vec1) != len(vec2) {
		panic("cant multiply vectors")
	}

	var res float64

	for i := 0; i < len(vec1); i++ {
		res = res + vec1[i]*vec2[i]
	}

	return res
}
