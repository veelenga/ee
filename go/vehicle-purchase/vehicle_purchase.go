package purchase

// NeedsLicense determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
func NeedsLicense(kind string) bool {
	return kind == "car" || kind == "truck"
}

// ChooseVehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in dictionary order.
func ChooseVehicle(option1, option2 string) string {
	better := option1

	if (option2 < option1) {
		better = option2
	}

	return better + " is clearly the better choice."
}

// CalculateResellPrice calculates how much a vehicle can resell for at a certain age.
func CalculateResellPrice(originalPrice, age float64) float64 {
	ratio := 0.8

	if age >= 10 {
		ratio = 0.5
	} else if age > 3 {
		ratio = 0.7
	}

	return originalPrice * ratio
}
