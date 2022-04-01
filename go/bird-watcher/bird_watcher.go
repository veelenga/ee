package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) int {
	result := 0
	for _, v := range birdsPerDay {
		result += v
	}
	return result
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	start := 7 * (week - 1)
	return TotalBirdCount(birdsPerDay[start : start+7])
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := range birdsPerDay {
		if i&1 == 0 {
			birdsPerDay[i]++
		}
	}
	return birdsPerDay
}
