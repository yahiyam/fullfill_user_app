import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

getUserLocationAddress(
  position,
  placemarks,
  locationController,
  flatNumber,
  city,
  state,
  completeAddress,
) async {
  Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  position = newPosition;

  placemarks =
      await placemarkFromCoordinates(position!.latitude, position!.longitude);

  Placemark pMark = placemarks![0];

  String fullAddress =
      '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

  locationController.text = fullAddress;

  flatNumber.text =
      '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}';
  city.text =
      '${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}';
  state.text = '${pMark.country}';
  completeAddress.text = fullAddress;
}
