import 'package:flutter/material.dart';
import 'package:flutter_uber_clone/Models/address.dart';

class AppData extends ChangeNotifier
{
  Address picUpLocation;

  void updatePickupLocationAddress(Address pickUpAddress)
  {
    picUpLocation=pickUpAddress;
    notifyListeners();
  }
}