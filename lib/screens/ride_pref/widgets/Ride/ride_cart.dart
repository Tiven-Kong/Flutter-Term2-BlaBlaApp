import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../../utils/date_time_util.dart';
import '../../../../theme/theme.dart';

class RideCard extends StatelessWidget {
  final Ride ride;
  final VoidCallback onTap;

  const RideCard({
    super.key,
    required this.ride,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(ride.driver.profilePicture),
              radius: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${ride.departureLocation.name} → ${ride.arrivalLocation.name}",
                    style: BlaTextStyles.body.copyWith(
                      fontWeight: FontWeight.w600,
                      color: BlaColors.neutralDark,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "${DateTimeUtils.formatTime(ride.departureDate)} - ${DateTimeUtils.formatTime(ride.arrivalDateTime)}",
                    style: BlaTextStyles.label.copyWith(
                      color: BlaColors.neutral,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${ride.pricePerSeat.toStringAsFixed(2)}",
                  style: BlaTextStyles.heading.copyWith(
                    fontSize: 16,
                    color: BlaColors.primary,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: BlaColors.primary, size: 14),
                    SizedBox(width: 4),
                    Text(
                      "4.8", // Dummy rating
                      style: BlaTextStyles.label.copyWith(
                        color: BlaColors.neutralDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
