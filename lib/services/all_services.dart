import 'package:starter_pack/services/design_service.dart';

class AllServices {

  static final AllServices _instance = AllServices._internal();

  late DesignService designService;

  factory AllServices() {
    return _instance;
  }

  AllServices._internal() {
    designService = DesignService();
  }

}