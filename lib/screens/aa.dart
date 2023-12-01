/* Welcome to the SparkCo coding challenge!
 *
 * Introduction:
 *
 * You're developing a cryptocurrency portfolio tracker app
 * for tracking your investments into SparkCo's official
 * cryptocurrency: SparkCoin.
 *
 * You're getting the historical price data from an
 * external API, but unfortunately they are missing
 * some data! 😨
 *
 * The blockchain provides the information
 * of how much SparkCoin you own and when you bought it,
 * but you need to find a way to know at what price
 * you bought it to track the growth of your investment!
 *
*/

// The price chart decipting the price of SparkCoin on each
// day of January 2023
final Map<DateTime, int> chart = {
  DateTime(2023, 1, 1): 120,
  DateTime(2023, 1, 2): 130,
  DateTime(2023, 1, 4): 140,
  DateTime(2023, 1, 7): 210,
  DateTime(2023, 1, 9): 410,
  DateTime(2023, 1, 11): 190,
  DateTime(2023, 1, 12): 100,
  DateTime(2023, 1, 14): 200,
  DateTime(2023, 1, 15): 220,
  DateTime(2023, 1, 16): 240,
  DateTime(2023, 1, 17): 245,
  DateTime(2023, 1, 18): 230,
  DateTime(2023, 1, 21): 401,
  DateTime(2023, 1, 22): 405,
  DateTime(2023, 1, 23): 410,
  DateTime(2023, 1, 26): 315,
  DateTime(2023, 1, 29): 320,
  DateTime(2023, 1, 30): 334,
  DateTime(2023, 1, 31): 420,
};

// The function for finding the price at the time of buy.
// As it is unlikely that there exists data for the exact time of buy,
// you should use the closest time there is.
//
// For example, if you have price data for Monday and Thursday,
// but want to find the price for Wednesday, you should get the
// price on Thursday.
int findBuyPrice(DateTime boughtAt, Map<DateTime, int> chart) {
  // TODO: write this function so that you get the most accurate
  // price for any given DateTime

  if(chart.containsKey(boughtAt)){
    return chart[boughtAt]!;
  }

  List<DateTime> sortedDates = chart.keys.toList()..sort((a, b)=> a.compareTo(b));

  DateTime closedDate = sortedDates.lastWhere((date) => date.isBefore(boughtAt), orElse: ()=> sortedDates.first);

  return chart[closedDate]!;

}

void main() {
  // should print 401
  print(findBuyPrice(DateTime(2023,1, 20), chart));
  // should print 140
  print(findBuyPrice(DateTime(2023,1, 5), chart));
}
