import 'package:flutter/material.dart';
import 'package:flutterterm2/app-widgets/location.dart';
import 'package:flutterterm2/screens/ride_pref/widgets/custom_button.dart';
import 'package:flutterterm2/theme/theme.dart';

import '../../../app-widgets/date.dart';
import '../../../app-widgets/seat_number.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'form.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  void _updateDeparture(Location newLocation) {
    setState(() {
      departure = newLocation;
    });
  }

  void _updateArrival(Location newLocation) {
    setState(() {
      arrival = newLocation;
    });
  }
  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  void _updateDepartureDate(DateTime newDate) {
    setState(() {
      departureDate = newDate;
    });
  }

  void _updateSeats(int newSeats) {
    setState(() {
      requestedSeats = newSeats;
    });
  }

  void _switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }
  void _onSearchPressed() {
    if (departure != null && arrival != null) {
      RidePref ridePref = RidePref(
        departure: departure!,
        arrival: arrival!,
        departureDate: departureDate,
        requestedSeats: requestedSeats,
      );

      Navigator.pop(context, ridePref);
    }
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                LocationPicker(
                  label: "Depature",
                  initialLocation: departure,
                  onLocationSelected: _updateDeparture,
                ),
                LocationPicker(
                  label: "Arrival",
                  initialLocation: arrival,
                  onLocationSelected: _updateArrival,
                ),
                DatePicker(
                  initialDate: departureDate,
                  onDateSelected: _updateDepartureDate,
                ),
                SeatNumberSpinner(
                  initialValue: requestedSeats,
                  onChanged: _updateSeats,
                ),
                CustomButton(bColor: BlaColors.primary, text: "Search", onPressed:_onSearchPressed)
              ],
            ),

          ]),
    );
  }
}
