// Package weather implements a weather forecast.
package weather

// CurrentCondition indicates a current wheather condition.
var CurrentCondition string
// CurrentLocation indicates a current wheather location.
var CurrentLocation string

// Forecast returns information about weather forecast
// at current location, showing the current conditions.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
