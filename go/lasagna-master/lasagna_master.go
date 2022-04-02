package lasagna

func PreparationTime(layers []string, time int) int {
	if (time <= 0) {
		time = 2
	}
	return len(layers) * time
}

func Quantities(layers []string) (int, float64) {
	noodles_count, sause_count := 0, 0

	for _, v := range layers {
		if v == "noodles" {
			noodles_count ++
		} else if v == "sauce" {
			sause_count ++
		}
	}
	return noodles_count * 50, float64(sause_count) * 0.2
}

func AddSecretIngredient(friendsList []string, misteryList []string) {
	l := len(misteryList)
	misteryList[l - 1] = friendsList[l - 2]
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
	result := make([]float64, len(quantities))

	for i, v := range quantities {
		result[i] = v * float64(portions) / 2
	}

	return result
}
